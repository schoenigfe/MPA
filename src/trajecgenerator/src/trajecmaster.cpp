#include "trajecmaster.h"
#include <stdexcept>


Trajecmaster::Trajecmaster(std::string name)
:   name(name), nh(ros::NodeHandle(name))
{
    ROS_INFO("Trajecmaster Start");
    //initalisieren der Services:
    addCircleTrajHandl = nh.advertiseService("addCircleTrajecHandler", &Trajecmaster::addCircleTHCallback, this);
    addCSplineTrajHandl = nh.advertiseService("addCSplineTrajecHandler", &Trajecmaster::addCSplineTHCallback, this);
    addCrSplineTrajHandl = nh.advertiseService("addCrSplineTrajecHandler", &Trajecmaster::addCrSplineTHCallback, this);
    removeTrajHandl = nh.advertiseService("removeTrajecHandler", &Trajecmaster::removeTHCallback, this);
    listTrajHandl = nh.advertiseService("listTrajecHandler", &Trajecmaster::listTHCallback, this);
}

Trajecmaster::~Trajecmaster(){
}

void Trajecmaster::update(float dt){
    std::map<std::string, std::shared_ptr<Trajechandler>>::iterator iter = trajecHandleMap.begin(); //alternativ typ auto verwenden...
    std::map<std::string, std::shared_ptr<Trajechandler>>::iterator it_end = trajecHandleMap.end();
    for (; iter != it_end; ++iter)  //aufruf für alle Handler des Masters
    {
        iter->second->updateTrajectory(dt);
    }
}


bool Trajecmaster::addCrsplineTrajectoryHandler(std::string name, std::vector<point> points, bool closed, float t, float k){
    if(name.empty()){   //leere namen verhindern
        ROS_ERROR("Failed to add Trajectory, because of empty name");
        return false;
    }   //bereits vergebene namen verhindern
    else if(trajecHandleMap.find(name) != trajecHandleMap.end()){
        ROS_ERROR("Failed to add Trajectory, Trajectory with this name already exists");
        return false;
    }
    else if(k<= 0.0){
        ROS_ERROR("Failed to add Trajectory, Parameter k is 0 or negativ");
        return false;
    }
    //erzeugen des neuen Handlers
    trajecHandleMap[name] = std::make_shared<Trajechandler>(name, std::shared_ptr<Trajectory>(new Crsplinetrajectory(points, closed)), t, k);

    return true;
}


bool Trajecmaster::addCSplineTrajectoryHandler(std::string name, std::vector<point> points, std::vector<double> T, tk::spline::spline_type type, bool closed, float t, float k){
    if(name.empty()){
        ROS_ERROR("Failed to add Trajectory, because of empty name");
        return false;
    }
    else if(trajecHandleMap.find(name) != trajecHandleMap.end()){
        ROS_ERROR("Failed to add Trajectory, Trajectory with this name already exists");
        return false;
    }
    else if(points.size() != T.size() || T.size() < 3){
        ROS_ERROR("Failed to add Trajectory, Points and T vektor need equal size with more then two elements");
        return false;
    }
    else if(k<= 0.0){
        ROS_ERROR("Failed to add Trajectory, Parameter k is 0 or negativ");
        return false;
    }

    trajecHandleMap[name] = std::make_shared<Trajechandler>(name, std::shared_ptr<Trajectory>(new Csplinetrajectory(points, T, type, closed)), t, k);

    return true;
}


bool Trajecmaster::addCircleTrajectoryHandler(std::string name, float mx, float my, float a, float b, float t, float k){

    if(name.empty()){
        ROS_ERROR("Failed to add Trajectory, because of empty name");
        return false;
    }
    else if(trajecHandleMap.find(name) != trajecHandleMap.end()){
        ROS_ERROR("Failed to add Trajectory, Trajectory with this name [%s] already exists" , name.c_str());
        return false;
    }
    else if(k<= 0.0){
        ROS_ERROR("Failed to add Trajectory, Parameter k is 0 or negativ");
        return false;
    }

    trajecHandleMap[name] = std::make_shared<Trajechandler>(name, std::shared_ptr<Trajectory>(new Circletrajectory(mx,my,a,b)), t, k);

    return true;
}


bool Trajecmaster::removeTrajectoryHandler(std::string name){
    std::map<std::string, std::shared_ptr<Trajechandler>>::iterator iter = trajecHandleMap.find(name);  //finden des Handlers
    if(iter == trajecHandleMap.end()){
        ROS_ERROR("Tried to remove Trajectory [%s], which does not exist", name.c_str());
        throw std::runtime_error("Tried to remove Trajectory, which does not exist");
        return false;
    }else{
        trajecHandleMap.erase(iter);
        return true;
    }
}

bool Trajecmaster::addCircleTHCallback(trajecgenerator::addCircleTrajecHandler::Request& Req, trajecgenerator::addCircleTrajecHandler::Response&){
    if(addCircleTrajectoryHandler(Req.name, Req.mx, Req.my, Req.a, Req.b, Req.time, Req.k)){
        ROS_INFO("Circle TrajectoryHandler [%s] added", Req.name.c_str());
        return true;
    }
    return false;
}
bool Trajecmaster::addCSplineTHCallback(trajecgenerator::addCSplineTrajecHandler::Request& Req, trajecgenerator::addCSplineTrajecHandler::Response&){

    std::vector<point> points;
    point point_;
    std::vector<double> T;
    //zusammensetzen der angaben aus dem Request in richtige Form
    if(Req.pointsX.size() == Req.pointsY.size() && Req.pointsY.size() == Req.T.size() && Req.T.size() >= 3){
        for(int i = 0; i < Req.T.size(); i++ ){
            T.push_back((double)Req.T[i]);
            point_.x = Req.pointsX[i];
            point_.y = Req.pointsY[i];
            points.push_back(point_);
        }
    }else{
        ROS_ERROR("Error: pointsX, pointsY and T need equal size and more than two elements");
        throw std::runtime_error("Error: pointsX, pointsY and T need equal size and more than two elements"); 
        return false;
    }

    //typ feststellen:
    tk::spline::spline_type type;
    switch (Req.type)
    {
    case 0:
        type = tk::spline::spline_type::cspline;
        break;
    case 1:
        type = tk::spline::spline_type::cspline_hermite;
        break;
    case 2:
        type = tk::spline::spline_type::linear;
        break; 
    default:
        type = tk::spline::spline_type::cspline;
        break;
    }

    //Trajektorienhandler erzeugen 
    if(addCSplineTrajectoryHandler(Req.name, points, T, type, Req.closed, Req.time, Req.k)){
        ROS_INFO("CSpline TrajectoryHandler [%s] added", Req.name.c_str());
        return true;
    }
    return false;
}


bool Trajecmaster::addCrSplineTHCallback(trajecgenerator::addCrSplineTrajecHandler::Request& Req, trajecgenerator::addCrSplineTrajecHandler::Response&){
    
    std::vector<point> points;

    point point_;
    if(Req.pointsX.size() == Req.pointsY.size()){
        for(int i = 0; i < Req.pointsX.size(); i++ ){
            point_.x = Req.pointsX[i];
            point_.y = Req.pointsY[i];
            points.push_back(point_);
            ROS_INFO("Added Point");
        }
    }else{
        ROS_ERROR("Error: pointsX and pointsY need equal size");
        throw std::runtime_error("Error: pointsX and pointsY need equal size");
        return false;
    }
    
    if(addCrsplineTrajectoryHandler(Req.name, points, Req.closed, Req.time, Req.k)){
        ROS_INFO("Crspline TrajectoryHandler [%s] added", Req.name.c_str());
        return true;
    }
    return false;
}



bool Trajecmaster::removeTHCallback(trajecgenerator::removeTrajecHandler::Request& Req, trajecgenerator::removeTrajecHandler::Response&){
    if(removeTrajectoryHandler(Req.name)){
        ROS_INFO("TrajectoryHandler [%s] removed", Req.name.c_str());
        return true;
    }
    return false;
}



bool Trajecmaster::listTHCallback(std_srvs::Empty::Request&, std_srvs::Empty::Response&){
    //statt auto auch std::map<std::string, std::shared_ptr<Trajechandler>>::iterator verwendbar
    std::cout << "List of Trajechandlers: " << std::endl;
    for(auto iter = trajecHandleMap.begin(); iter != trajecHandleMap.end(); iter++){
        std::cout << "\t" << iter->first << std::endl;
    }
    return true;
}
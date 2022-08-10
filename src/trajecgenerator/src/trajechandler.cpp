#include "trajechandler.h"
#include "pos_d.h"

Trajechandler::Trajechandler(std::string name, std::shared_ptr<Trajectory> trajec_, float s, float k)
    : trajec(trajec_), nh(ros::NodeHandle(name)), handlername(name), s(s), k(k), torobot(name)
{
    ///Publisher und Services erstellen
    setKSrv = nh.advertiseService("setK", &Trajechandler::setKCallback, this);
    startStopSrv = nh.advertiseService("startStop", &Trajechandler::startStopCallback, this);
    setTimeSrv = nh.advertiseService("setTime", &Trajechandler::setTimeCallback, this);
    plotTrajectorySrv = nh.advertiseService("plotTrajectory", &Trajechandler::plotTrajectoryCallback, this);
    plotTrajecXoYSrv = nh.advertiseService("plotTrajecXoY", &Trajechandler::plotTrajecXoYCallback, this);
    activateConstVelocitySrv = nh.advertiseService("activateConstVelocity", &Trajechandler::activateConstVelocityCallback, this);
    setConstVelocitySrv = nh.advertiseService("setConstVelocity", &Trajechandler::setConstVelocityCallback, this);
}

Trajechandler::~Trajechandler(){

}

void Trajechandler::updateTrajectory(float dt){
    //only if active time is counted up
    if(active){


        if(constVelocityActive){
            //Die konstante Bahngeschwindigkeit ist nur approximiert (bei scharfen Kurven usw. wird sie nicht eingehalten)
            //Umsetzung: Schrittweite, um die der Kurvenparameter T erhöht wird wird entsprechend der aktuellen Geschwindigkeit
            //und der Sollgeschwindigkeit angepasst
            point deriv = trajec->getDeriv(s,1);
            float dx = deriv.x;
            float dy = deriv.y;
            // ist_vel = sqrt(dx*dx + dy*dy);
            float m = constVel/(sqrt(dx*dx + dy*dy));

            K=m;       //Steigung bzw. 1. Ableitung 
            s=s+dt*m;  //ein Schritt weiter
            S = s;
        }
        else{
            // nicht konstante Geschwindigkeit: Kurvenparameter wird linear erhöht (s=s+dt)
            // Faktor k beschreibt die Steigung (1.Ableitung und muss auch mit übergeben werden)

            s = s+dt;       // interne Zeit des Handlers erhöhen
            S= s*k;        // Kurvenparameter der Trajektorie
            K = k;
        }

    }

    torobot.storeInTrajectory(trajec->getTrajec(S,K,0));
    torobot.publish();
}

void Trajechandler::setK(float k_){
    this->k = k_;
}

void Trajechandler::setTime(float t_){
    this->s = t_;
    this->S = t_;
}

void Trajechandler::startStop(bool b){
    this->active = b;
}

void Trajechandler::plotTrajecXoY(std::string title, Trajectory::x_or_y koordinate, double maxT, double dT, float k, std::pair<double,double> xrange, std::pair<double,double> yrange){
    trajec->plotTrajecXoY(title, koordinate, maxT, dT, k, xrange, yrange);
}

void Trajechandler::plotTrajectory(std::string title, double maxT, double dT, float k, std::pair<double,double> xrange, std::pair<double,double> yrange){
    trajec->plotTrajectory(title, maxT, dT, k, xrange, yrange);
}

void Trajechandler::activateConstVelocity(bool b){
    this->constVelocityActive = b;
}

void Trajechandler::setConstVelocity(float vel){
    this->constVel = vel;
}

bool Trajechandler::setKCallback(trajecgenerator::float32Request::Request& req, trajecgenerator::float32Request::Response&){
    setK(req.f);
    ROS_INFO("K changed");
    return true;
}

bool Trajechandler::startStopCallback(trajecgenerator::boolRequest::Request& req, trajecgenerator::boolRequest::Response&){
    startStop(req.b);
    ROS_INFO("Active state changed");
    return true;
}

bool Trajechandler::setTimeCallback(trajecgenerator::float32Request::Request& req, trajecgenerator::float32Request::Response&){
    setTime(req.f);
    ROS_INFO("Time changed");
    return true;
}

bool Trajechandler::plotTrajectoryCallback(trajecgenerator::plotTrajectory::Request& req, trajecgenerator::plotTrajectory::Response&){

    std::pair<double, double> xRange = {req.xrange[0], req.xrange[1]};
    std::pair<double, double> yRange = {req.yrange[0], req.yrange[1]};

    plotTrajectory(req.title, req.maxT, req.dT, req.k, xRange, yRange);
    return true;
}
bool Trajechandler::plotTrajecXoYCallback(trajecgenerator::plotTrajecXoY::Request& req, trajecgenerator::plotTrajecXoY::Response&){

    std::pair<double, double> xRange = {req.xrange[0], req.xrange[1]};
    std::pair<double, double> yRange = {req.yrange[0], req.yrange[1]};

    Trajectory::x_or_y x_o_y;
    switch (req.typeXoY)
    {
    case 0:
        x_o_y = Trajectory::x_or_y::x;
        break;
    case 1:
        x_o_y = Trajectory::x_or_y::y;
        break;
    default:
        x_o_y = Trajectory::x_or_y::x;
        break;
    }

    plotTrajecXoY(req.title, x_o_y, req.maxT, req.dT, req.k, xRange, yRange);
    return true;
}


bool Trajechandler::activateConstVelocityCallback(trajecgenerator::boolRequest::Request& req, trajecgenerator::boolRequest::Response&){
    constVelocityActive = req.b;
    ROS_INFO("Const velocity settings changed");
    return true;
}

bool Trajechandler::setConstVelocityCallback(trajecgenerator::float32Request::Request& req, trajecgenerator::float32Request::Response&){
    constVel = req.f;
    ROS_INFO("Const velocity changed");
    return true;
}


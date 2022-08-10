
#include "trajectory.h"

Trajectory::Trajectory(){

}
Trajectory::~Trajectory(){
    
}

//Gnuplot Trajectory::gp;

unsigned int Trajectory::windowNum = 50;

void Trajectory::plotTrajecXoY(std::string title, Trajectory::x_or_y koordinate, double maxT, double dT, float k, std::pair<double,double> xrange, std::pair<double,double> yrange){

    //abfangen ungültiger Werte für k und dT (sonst wird ewig gerechnet und das Programm stürzt ab)
    if(k <= 0.0){
        k = 0.1;
    }
    if(dT <= 0.0){
        dT = 0.1;
    }

    int windowNum = Trajectory::windowNum;
    Trajectory::windowNum += 1;

	std::vector<std::pair<double, double> > pts;
	for(double t=0; t*k<maxT; t+=dT*k) {
        if(koordinate == Trajectory::x_or_y::x){
            pts.push_back(std::make_pair(t, this->getPoint(t*k).x));
        }else{
            pts.push_back(std::make_pair(t, this->getPoint(t*k).y));
        }
	}

    std::vector<std::pair<double, double> > d_pts;
	for(double t=0; t*k<maxT; t+=dT*k) {
        if(koordinate == Trajectory::x_or_y::x){
            d_pts.push_back(std::make_pair(t, this->getDeriv(t*k,k).x));
        }else{
            d_pts.push_back(std::make_pair(t, this->getDeriv(t*k,k).y));
        }
	}    

    std::vector<std::pair<double, double> > dd_pts;
	for(double t=0; t*k<maxT; t+=dT*k) {
        if(koordinate == Trajectory::x_or_y::x){
            dd_pts.push_back(std::make_pair(t, this->getDeriv2(t*k,k,0).x));
        }else{
            dd_pts.push_back(std::make_pair(t, this->getDeriv2(t*k,k,0).y));
        }
	}       

	//Trajectory::gp << "set term wxt "<< windowNum << " \n"<< "set xrange ["<<xrange.first<<":"<< xrange.second <<"]\nset yrange ["<<yrange.first<<":"<<yrange.second<<"]\n";
	//Trajectory::gp << "set term wxt title '"<< title << "'\n";
    //Trajectory::gp << "plot" << Trajectory::gp.file1d(pts) << "with lines title 'x',"
    //    << Trajectory::gp.file1d(d_pts) << "with lines title 'xd'," 
    //    << Trajectory::gp.file1d(dd_pts) << "with lines title 'xdd'" 
    //    << std::endl;
}

void Trajectory::plotTrajectory(std::string title, double maxT, double dT, float k, std::pair<double,double> xrange, std::pair<double,double> yrange){

    //abfangen ungültiger Werte für k und dT (sonst wird ewig gerechnet und das Programm stürzt ab)
    if(k <= 0.0){
        k = 0.1;
        ROS_INFO("ungültiger Wert fuer k: k auf 0.1 gesetzt");
    }
    if(dT <= 0.0){
        dT = 0.1;
        ROS_INFO("ungültiger Wert fuer dT: dT auf 0.1 gesetzt");
    }

    int windowNum = Trajectory::windowNum;
    Trajectory::windowNum += 1;

    std::vector<std::pair<double, double> > trajec;
	for(double t=0; t*k<maxT; t+=dT*k) {
		point pos = this->getPoint(t*k);
        trajec.push_back(std::make_pair(pos.x, pos.y));
	}      

	//Trajectory::gp << "set term wxt "<< windowNum << " \n"<< "set xrange ["<<xrange.first<<":"<< xrange.second <<"]\nset yrange ["<<yrange.first<<":"<<yrange.second<<"]\n";
	//Trajectory::gp << "set term wxt title '"<< title << "'\n";
    //Trajectory::gp << "plot" << Trajectory::gp.file1d(trajec) << "with lines title 'trajec'" << std::endl;

}
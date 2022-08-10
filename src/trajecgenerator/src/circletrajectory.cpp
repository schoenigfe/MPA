#include "circletrajectory.h"
#include <math.h>

    Circletrajectory::Circletrajectory(float mx, float my, float a, float b)
        : mx(mx), my(my), a(a), b(b)
    {
    }
    Circletrajectory::~Circletrajectory(){
    }

    point Circletrajectory::getPoint(float phi){
        float x_m = mx;    //Versatz des Mittelpunkts in x-Richtung
        float y_m = my;    //Versatz des Mittelpunkts in y-Richtung
        point output;
        output.x = a*cos(phi)+x_m;
        output.y = b*sin(phi)+y_m;
        return output;
    }

    point Circletrajectory::getDeriv(float phi, float d_phi){
        point output;
        output.x = -a*sin(phi)*d_phi;
        output.y = b*cos(phi)*d_phi;
        return output;
    }

    point Circletrajectory::getDeriv2(float phi, float d_phi, float dd_phi){
        point output;
        output.x = -a*cos(phi) * d_phi*d_phi - a*sin(phi)*dd_phi;
        output.y = -b*sin(phi) * d_phi*d_phi + b*cos(phi)*dd_phi;
        return output;
    }

    pos_d Circletrajectory::getTrajec(float phi, float d_phi, float dd_phi){
        float x_m = mx;    //Versatz des Mittelpunkts in x-Richtung
        float y_m = my;    //Versatz des Mittelpunkts in y-Richtung
        pos_d output;
        output.x = a*cos(phi)+x_m;
        output.y = b*sin(phi)+y_m;
        //std::cout << "X: " << output.x << " Y: " << output.y << std::endl;
        output.dx = -a*sin(phi)*d_phi;
        output.dy = b*cos(phi)*d_phi;
        output.ddx = -a*cos(phi) * d_phi*d_phi - a*sin(phi)*dd_phi;
        output.ddy = -b*sin(phi) * d_phi*d_phi + b*cos(phi)*dd_phi;
        return output;
    }
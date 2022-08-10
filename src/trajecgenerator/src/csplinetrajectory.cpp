#include "csplinetrajectory.h"
#include <iostream>
#include <stdexcept>

Csplinetrajectory::Csplinetrajectory(std::vector<point> points_, std::vector<double> T_, tk::spline::spline_type type, bool closed)
    : /*points(points), T(T),*/ s_type(type), closed(closed)
{
    this->T = T_;
    this->points = points_;

    if(T.size() != points.size() || T.size() < 3 || !(std::is_sorted(T.begin(), T.end()))){
        throw std::invalid_argument("invalid parameters points or T in constructor of Csplinetrajectory (length of vectors must be equal and greater then two, T must be sorted)");
    }

    if(closed){
        //geschlossene Splines! 4 Punkte vom Anfang (ab 2. Punkt!) hinten anhängen um Splines zu schließen, Endpunkt und Anfangspunkt müssen identisch sein
        int Tsize = T.size();
        for(int i = 1; i<5; i++){               
            T.push_back(T[i]-T[0]+T[Tsize-1]);
            points.push_back(points[i]);
        }

    }  

    //punkte in den Vektoren X und Y übertragen
    for(int i = 0; i<points.size(); i++){
        X.push_back(points.at(i).x);
        Y.push_back(points.at(i).y);
    }

    //Splines erzeugen
    sx = std::unique_ptr<tk::spline>(new tk::spline(T, X, s_type));
    sy = std::unique_ptr<tk::spline>(new tk::spline(T, Y, s_type));
}

point Csplinetrajectory::getPoint(float s){
    point out;
    if(closed){ //fall geschlossener Trajektorien
        //s = fmod(s,getNumPoints()); //Kurvenparameter wiederholt sich Endlos

    if(s>T[2]){
        s = s-T[2];
        s = fmod(s,T[getNumPoints()]);
        s = s+T[2];
    } 

    }else{      //Fall offener Trajektorien (Stillstand am letzten Punkt)
        if(s > sx->get_x_max()){
            out.x = (*sx)(sx->get_x_max());
            out.y = (*sy)(sy->get_x_max());
            return out;
        }
        
    }
    out.x = (*sx)(s);
    out.y = (*sy)(s);
    return out;
}

point Csplinetrajectory::getDeriv(float s, float ds){
    point out;
    if(closed){ //geschlossene Tarjektorie
        //s = fmod(s,getNumPoints()); //Kurvenparameter wiederholt sich Endlos

    if(s>T[2]){
        s = s-T[2];
        s = fmod(s,T[getNumPoints()]);
        s = s+T[2];
    }    

    }else{  //offene Trajektorie: Stillstand am Ende  
        if(s > sx->get_x_max()){
            out.x = 0;
            out.y = 0;
            return out;
        }
    }
    out.x = sx->deriv(1,s)*ds;
    out.y = sy->deriv(1,s)*ds;
    return out;
}

point Csplinetrajectory::getDeriv2(float s, float ds, float dds){
    point out;
    if(closed){     //geschlossene Trajektorie
        //s = fmod(s,getNumPoints()); //Kurvenparameter wiederholt sich Endlos

    if(s>T[2]){
        s = s-T[2];
        s = fmod(s,T[getNumPoints()]);
        s = s+T[2];
    }    

    }else{      //offene Trajektorie: Stillstand am Ende
        if(s > sx->get_x_max()){
            out.x = 0;
            out.y = 0;
            return out;
        }
        
    }
    out.x = sx->deriv(2,s)*ds*ds + sx->deriv(1,s)*dds;
    out.y = sy->deriv(2,s)*ds*ds + sy->deriv(1,s)*dds;
    return out;
}

pos_d Csplinetrajectory::getTrajec(float s, float ds, float dds){
    pos_d out;
    point xy = getPoint(s);
    point xyd = getDeriv(s,ds);
    point xydd = getDeriv2(s,ds,dds);
    out.x = xy.x;
    out.y = xy.y;
    out.dx = xyd.x;
    out.dy = xyd.y;
    out.ddx = xydd.x;
    out.ddy = xydd.y;
    return out;
}

void Csplinetrajectory::addPoint(point p, float s){
    //punkte in den Vektoren X und Y übertragen
    points.push_back(p);
    X.push_back(p.x);
    Y.push_back(p.y);
    T.push_back(s);
    //Splines neu erzeugen
    sx = std::unique_ptr<tk::spline>(new tk::spline(T, X, s_type));
    sy = std::unique_ptr<tk::spline>(new tk::spline(T, Y, s_type));    
}

std::vector<point> Csplinetrajectory::getPoints(){
    return points;
}

int Csplinetrajectory::getNumPoints(){
    if(closed){
        return X.size()-5;  //bei einer geschlossenen trajektorie werden die letzten Punkte nicht mitgezählt, da diese mit den ersten beiden überlagert werden
    }else{
        return X.size();
    }
}

void Csplinetrajectory::setClosed(bool c){
    closed = c;
}
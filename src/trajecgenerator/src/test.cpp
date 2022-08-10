#include "crsplinetrajectory.h"

Crsplinetrajectory::Crsplinetrajectory(bool c){
    this->closed = c;
}

Crsplinetrajectory::Crsplinetrajectory(std::vector<point> p, bool c){
    this->points = p;
    this->closed = c;
}

void Crsplinetrajectory::calcPoints(point& p0, point& p1, point& p2, point& p3, std::vector<float> T, float& s){

    int ip0, ip1, ip2, ip3;

    //anfangs und Endpunkte extra behandeln (Start- und Endsteigung)
    if(closed){ //geschlossene Kurve
    	
    	s = s % T[points.size()-1];	//s in den Bereich von 0 bis max bringen

	//Konturpunkt finden, bei dem der aktuelle Intervall beginnt:
	ip1 = T.size()-1;
	for(int i = 0; i < T.size(); i++){
		if(T[i] >= s){
			ip1 = i-1;
			break;
		}
	}

        ip2 = (ip1 + 1)% points.size();
        ip3 = (ip2 + 1)% points.size();
        ip0 = (ip1 - 1)% points.size();

        p1 = points[ip1];
        p2 = points[ip2];

        //schließen der Kurve
        if(ip0 < 0){
            p0 = points[points.size()-1];   //Anfangspunkt = Endpunkt
            ip0 = points.size()-1;
        }else{
            p0 = points[ip0];
        }
        if(ip3 >= points.size()){
            p3 = points[0];     //Endpunkt = Anfangspunkt
            ip3 = 0;
        }else{
            p3 = points[ip3];
        }
    }
    else{   //offene Kurve

	//Konturpunkt finden, bei dem der aktuelle Intervall beginnt:
	ip1 = T.size();
	
	for(int i = 0; i < T.size(); i++){
		if(T[i] >= s){
			ip1 = i-1;
			break;
		}
	}   
        
        ip2 = ip1+1;      //Endpunkt des aktuellen Stücks
        ip3 = ip1+2;      //Nachfolgender Punkt
        ip0 = ip1-1;      //Vorgänger Punkt
        
        //Spline Ende überschritten
            //Alle Punkte auf den Endpunkt Setzen --> dieser wird für jede Zeit
            //t als Sollwert berechnet, ableitungen sind 0
        if(ip1 >= points.size()-1){
            p1 = points[points.size()-1];
            p2 = points[points.size()-1];
            p3 = points[points.size()-1];
            p0 = points[points.size()-1];
            std::cout << "ende" << std::endl;
            return;
        }

        p1 = points[ip1];
        p2 = points[ip2];


        //bei Anfang und Endpunkt interpolieren von p0 bzw. p3

        if(ip0 < 0){
            p0.x = 2*points[ip1].x - points[ip2].x;
            p0.y = 2*points[ip1].y - points[ip2].y;
        }else{
            p0 = points[ip0];
        }
        if(ip3 >= points.size()){
            p3.x = 2*points[ip2].x - points[ip1].x;
            p3.y = 2*points[ip2].y - points[ip1].y;
        }else{
            p3 = points[ip3];                
        }
    }


	// s in den Intervall zwischen 0 und 1 bringen
	float start_s = T[p1];
	float ende_s = T[p2];
	float intervalllaenge = T[p2]-T[p1];
	if(p2 = points.length()-1){		//für den übergang am Ende des geschlossenen 	Splines
		intervalllaenge = T[p2];
	}

	s = s- T[p1]; 	//Parameter nach dem Start des 
	
	//s in den Intervall 0 bis 1:
	
	s = s/intervalllaenge;



}

point Crsplinetrajectory::getPoint(float s){

    point p0, p1, p2, p3;

    calcPoints(p0, p1, p2, p3, s);

    float s_2 = s*s;
    float s_3 = s_2*s;

    float a = 0.5;
    float a0 = -a*s_3 + a*2*s_2 -a*s;
    float a1 = (2-a)*s_3 + (a-3)*s_2 +1;
    float a2 = (a-2)*s_3 + (3-2*a)*s_2 + a*s; 
    float a3 = a*(s_3-s_2);

    float x = p0.x * a0 + p1.x * a1 + p2.x * a2 + p3.x * a3;
    float y = p0.y * a0 + p1.y * a1 + p2.y * a2 + p3.y * a3;   

    point output;
    output.x = x;
    output.y = y;
    return output;
}

point Crsplinetrajectory::getDeriv(float s, float ds){

    point p0, p1, p2, p3;

    calcPoints(p0, p1, p2, p3, s);

    float s_2 = s*s;
    float s_3 = s_2*s;

    float a = 0.5;

    float a0 = (-a*3*s_2 + a*4*s -a)*ds;
    float a1 = ((2-a)*3*s_2 + (a-3)*2*s)*ds;
    float a2 = ((a-2)*3*s_2 + (3-2*a)*2*s + a)*ds; 
    float a3 = (a*(3*s_2-2*s))*ds;

    float x = p0.x * a0 + p1.x * a1 + p2.x * a2 + p3.x * a3;
    float y = p0.y * a0 + p1.y * a1 + p2.y * a2 + p3.y * a3;       

    point output;
    output.x = x;
    output.y = y;
    return output;
}

point Crsplinetrajectory::getDeriv2(float s, float ds, float dds){

    point p0, p1, p2, p3;

    calcPoints(p0, p1, p2, p3, s);

    float s_2 = s*s;
    float s_3 = s_2*s;

    float a = 0.5;
    float a0 = (-a*6*s + a*4)*ds*ds + (-a*3*s_2 + a*4*s -a)*dds;
    float a1 = ((2-a)*6*s + (a-3)*2)*ds*ds + ((2-a)*3*s_2 + (a-3)*2*s)*dds;
    float a2 = ((a-2)*6*s + (3-2*a)*2)*ds*ds + ((a-2)*3*s_2 + (3-2*a)*2*s + a)*dds; 
    float a3 = (a*(6*s-2))*ds*ds + (a*(3*s_2-2*s))*dds;;

    float x = p0.x * a0 + p1.x * a1 + p2.x * a2 + p3.x * a3;
    float y = p0.y * a0 + p1.y * a1 + p2.y * a2 + p3.y * a3;   

    point output;
    output.x = x;
    output.y = y;
    return output;
}

pos_d Crsplinetrajectory::getTrajec(float s, float ds, float dds){

    point pos = getPoint(s);

    point deriv1 = getDeriv(s, ds);

    point deriv2 =getDeriv2(s, ds, dds);

    pos_d output;
    output.x = pos.x;
    output.y = pos.y;
    output.dx = deriv1.x;
    output.dy = deriv1.y;
    output.ddx = deriv2.x;
    output.ddy = deriv2.y;
    return output;
}

void Crsplinetrajectory::addPoint(point p){
    points.push_back(p);
}

std::vector<point> Crsplinetrajectory::getPoints(){
    return points;
}

int Crsplinetrajectory::getNumPoints(){
    return (int)points.size();
}

void Crsplinetrajectory::setClosed(bool c){
    this->closed = c;
}



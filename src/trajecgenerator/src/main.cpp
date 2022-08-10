/**
 * Hauptprogramm für den Trajektoriengenerator: 
 *  hier können trajecmaster erzeugt und aufgerufen werden.
 *  ein Master kann mehrere trajechandler enthalten. Jeder trajechandler enthält eine Trajektorie
 *  Zum ausführen muss die update-Funktion des Masters zyklisch aufgerufen werden und die verstrichene Zeit (updaterate) übergeben werden
 */

#include "ros/ros.h"
#include "trajecmaster.h"


int main(int argc, char **argv)
{

  ros::init(argc, argv, "trajecgenerator");
  ros::NodeHandle n;

  //Updaterate 100Hz:
  float rate = 100.0f;
  ros::Rate loop_rate(rate);

//hier die Master erzeugen und evtl. schon Trajectorien erzeugen (alternativ über Services) mit namen
  Trajecmaster master("m1");

/*
  //master.addTrajectory("robot1", "type");
  master.addCircleTrajectoryHandler("robot1", 4.0, 4.0, 1.0, 2.0, 0.0, 0.2);
  //master.addCrsplineTrajectoryHandler("robot1", {{1,1},{6,6},{2,6},{4,3},{1,3}}, true, 0.0, 0.3);
  master.addCrsplineTrajectoryHandler("robot2", {{1,1},{6,6},{2,6},{4,3},{1,3}}, true, 0.0, 0.3);
  //master.addCrsplineTrajectoryHandler("robot3", {{1,1},{6,6},{2,6},{4,3},{1,3}}, true, 0.0, 0.3);
  //master.addCrsplineTrajectoryHandler("robot4", {{1,1},{6,6},{2,6},{4,3},{1,3}}, true, 0.0, 0.3);
  master.addCSplineTrajectoryHandler("robot3", {{1,1},{6,6},{2,6},{4,3},{1,3},{1,1},{6,6},{2,6},{4,3},{8,8}}, {0, 1 , 2, 3, 4, 5, 6,7,8,9}, tk::spline::cspline, true, 0.0, 0.2);
  master.addCSplineTrajectoryHandler("robot44", {{1,1},{6,6},{2,6},{4,3},{8,8},{1,1},{6,6},{2,6},{4,3},{8,8}}, {0, 1 , 2, 3, 4, 5, 6,7,8,9}, tk::spline::cspline, true, 0.0, 0.2);
master.addCSplineTrajectoryHandler("robot4", {{1,1},{8,8},{2,6},{1,2},{8,8},{1,1},{8,8},{2,6},{1,2},{8,8}}, {0, 1 , 2, 3, 4, 5, 6,7,8,9}, tk::spline::cspline, true, 0.0, 0.2);
 master.addCSplineTrajectoryHandler("robot4b", {{1,1},{4,4},{2,6},{1,2},{8,8},{1,1},{4,4},{2,6},{1,2},{8,8},{1,1},{4,4},{2,6},{1,2},{8,8}}, {0, 1 , 2, 3, 4, 5, 6,7,8,9,10,11,12,13,14}, tk::spline::cspline, true, 0.0, 0.2);
  master.addCSplineTrajectoryHandler("robot5", {{1,1},{6,6},{2,6},{4,3},{1,3},{1,1},{6,6},{2,6},{4,3},{1,3}}, {0, 1 , 2, 3, 4, 5, 6,7,8,9}, tk::spline::cspline, true, 0.0, 0.2);
  master.addCSplineTrajectoryHandler("robot6", {{1,1},{6,6},{2,6},{4,3},{1,3},{1,1},{6,6},{2,6},{4,3},{1,3}}, {0, 1.5 , 2, 3.5, 4, 5, 6.5,7,8.5,9}, tk::spline::cspline, true, 0.0, 0.2);
*/  
  /*
    bool addCrsplineTrajectoryHandler(std::string name, std::vector<point> points, bool closed, float k);
    bool addCSplineTrajectoryHandler(std::string name, std::vector<point> points, std::vector<double> T, tk::spline::spline_type type, bool closed, float k);
    bool addCircleTrajectoryHandler(std::string name, float mx, float my, float a, float b, float k);
  */


double t = 0;
  while (ros::ok()) // while ros is running
  {
    ros::spinOnce();

//hier die Master aufrufen:
    master.update(1/rate);




    loop_rate.sleep();
  }
  return 0;
}

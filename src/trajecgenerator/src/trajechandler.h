#ifndef _TRAJECHANDLER_H
#define _TRAJECHANDLER_H

#include <ros/ros.h>
#include "trajectory.h"
#include "circletrajectory.h"
#include "crsplinetrajectory.h"
#include "csplinetrajectory.h"
#include <string>
#include "trajecgenerator/float32Request.h"
#include "trajecgenerator/boolRequest.h"
#include "trajecgenerator/plotTrajectory.h"
#include "trajecgenerator/plotTrajecXoY.h"

#include "trajectorobot.h"


/**
 * Klasse Trajechandle: enthält eine Trajektorie (Derivate der Klasse Trajektory)
 *  Der Handler stellt verschiedene Funktionen und Services für die Trajektorien bereit
 */
class Trajechandler{

public:
    /**
     * Konstruktor
     * @param [in] name: Name des Handlers, unter diesem sind die services erreichbar und wird die Trajektorie veröffentlicht
     * @param [in] trajec: Trajektorie des Handlers
     * @param [in] s: Startwert des Kurvenparameters
     * @param [in] k: Parameter, wie schnell die Trajektorie durchlaufen wird (time*k ist Zeit für den Durchlauf der Trajektorie)
     */
    Trajechandler(std::string name, std::shared_ptr<Trajectory> trajec_, float s, float k);
    ///Dekonstruktor
    ~Trajechandler();

    /**
     * Funktion zum update der Trajektorie: durch aufruf der Funktion wird ein neuer Trajektorienwert veröffentlicht
     * @param [in] dt: Zeit seit dem letzten Aufruf der Funktion. Damit wird die interne Zeit des Handlers erhöht
     */
    void updateTrajectory(float dt);

    /**
     * Funktion zum verändern der member-Variable k
     * @param [in] k: Gibt geschwindigkeit des Durchlaufs der Trajektorie vor
     */
    void setK(float k);

    /**
     * Funktion zum setzen der internen Zeit des Handlers
     * @param [in] t: neue Zeit des Handlers
     */
    void setTime(float t);

    /**
     * Starten bzw. Anhalten der Trajektorie, Bei einem Stopp wird die interne Zeit des handlers angehalten, wodurch
     * die Trajektorie nicht weiterläuft und auf dem Wert, vorgegeben durch der angehaltenen Zeit, stehen bleibt
     * @param [in] b: true: starten bzw. weiterlaufen der Trajektorie, false: stoppen der Trajektorie
     */
    void startStop(bool b);

    /**
     * Funktion zum aufrufen der plotTrajecXoY Funktion der zugrundeliegenden Trajektorie (Stellt verlauf der x bzw. y Koordinate der Trajektorie über die Zeit dar)
     * @param [in] title: Titel des Plots
     * @param [in] koordinate: auswahl der x oder y koordinate der Trajektorie
     * @param [in] maxT: Angabe der maximalen Zeit, über die geplottet wird (Zeit startet bei 0)
     * @param [in] dT: Schrittweite (Zeit) für den Plot
     * @param [in] k: Geschwindigkeit der Trajektorie
     * @param [in] xrang: Breite des Graphens in X-Richtung
     * @param [in] yrang: Breite des graphens in Y-Richtung
     */
    void plotTrajecXoY(std::string title, Trajectory::x_or_y koordinate, double maxT, double dT, float k, std::pair<double,double> xrange, std::pair<double,double> yrange);

    /**
     * Funktion zum aufrufen der plotTrajectory Funktion der zugrundeliegenden Trajektorie (Stellt die Trajektorie dar)
     * @param [in] title: Titel des Plots
     * @param [in] maxT: Angabe der maximalen Zeit, über die geplottet wird (Zeit startet bei 0)
     * @param [in] dT: Schrittweite (Zeit) für den Plot
     * @param [in] k: Geschwindigkeit der Trajektorie
     * @param [in] xrang: Breite des Graphens in X-Richtung
     * @param [in] yrang: Breite des graphens in Y-Richtung
     */
    void plotTrajectory(std::string title, double maxT, double dT, float k, std::pair<double,double> xrange, std::pair<double,double> yrange);

    /**
     * Funktion zum Aktivieren bzw. Deaktivieren der konstanten bahngeschwindigkeit
     * @param[in] b: ture: konstante Bahngeschwindigkeit, false: nicht konstant
     */
    void activateConstVelocity(bool b);

    /**
     * Funktion zum Setzen der konstanten Bahngeschwindigkeit
     * @param[in] vel: Wert der konstanten Geschwindigkeit
     */
    void setConstVelocity(float vel);

private:

    ///Steigung des Kurvenparameter für den Spline
    float k = 0;
    float K = 0;    //zuletzt genutzte Version

    ///Kurvenparameter des Handlers
    float s = 0;
    float S = 0;    //zuletzt genutzte Version

    ///Legt fest, ob mit konstanter Bahngeschwindigkeit (true) die Trajektorie durchlaufen wird
    bool constVelocityActive = false;

    ///Konstante Bahngeschwindigkeit auf der Trajektorie
    float constVel = 1.0;

    ///Legt fest, ob Trajektorie aktiv (true) oder gestoppt (false) ist
    bool active = true;

    ///name des Handlers, unter diesem Namen sind die topics und services des Handlers verfügbar
    std::string handlername;

    ///Trajektorie
    std::shared_ptr<Trajectory> trajec;

    ///node Handle für den Trajektorienhandler
    ros::NodeHandle nh;

    ToRobot torobot;


    ///Serivce Servers:
    ///Service zum Setzen von k
    ros::ServiceServer setKSrv;
    ///Service zum Starten/ stoppen der Trajektorie (umschalten von active)         
    ros::ServiceServer startStopSrv;
    ///Service zum Setzen der Zeit des Handlers
    ros::ServiceServer setTimeSrv;
    ///Service zum Plotten der Trajektorie
    ros::ServiceServer plotTrajectorySrv;
    ///Service zum Plotten der x- bzw. y-Koordinaten der Trajektorie
    ros::ServiceServer plotTrajecXoYSrv;
    ///Service zum Aktivieren der konstanten Bahngeschwindigkeit
    ros::ServiceServer activateConstVelocitySrv;
    ///Service zum Sekten der konstanten Bahngeschwindigkeit
    ros::ServiceServer setConstVelocitySrv;

    //Callback funktionen für die Services:
    bool setKCallback(trajecgenerator::float32Request::Request&, trajecgenerator::float32Request::Response&);
    bool startStopCallback(trajecgenerator::boolRequest::Request&, trajecgenerator::boolRequest::Response&);
    bool setTimeCallback(trajecgenerator::float32Request::Request&, trajecgenerator::float32Request::Response&);
    bool plotTrajectoryCallback(trajecgenerator::plotTrajectory::Request&, trajecgenerator::plotTrajectory::Response&);
    bool plotTrajecXoYCallback(trajecgenerator::plotTrajecXoY::Request&, trajecgenerator::plotTrajecXoY::Response&);
    bool activateConstVelocityCallback(trajecgenerator::boolRequest::Request&, trajecgenerator::boolRequest::Response&);
    bool setConstVelocityCallback(trajecgenerator::float32Request::Request&, trajecgenerator::float32Request::Response&);

};


#endif //_TRAJECHANDLER_H
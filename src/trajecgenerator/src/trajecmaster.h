#ifndef _TRAJECMASTER_H
#define _TRAJECMASTER_H

#include <map>
#include <string>
#include "trajechandler.h"
#include <ros/ros.h>
#include <std_srvs/Empty.h>
#include "trajecgenerator/addCircleTrajecHandler.h"
#include "trajecgenerator/addCrSplineTrajecHandler.h"
#include "trajecgenerator/addCSplineTrajecHandler.h"
#include "trajecgenerator/removeTrajecHandler.h"

/**
 * Klasse für den Trajectorienmaster zur Verwaltung mehrerer Trajektorienhandler
 *  Stellt Services zum Erstellen und Lösen von Trajektorienhandlern bereit
 */
class Trajecmaster{

public:

    /**
     * Konstruktor:
     * @param [in] name: Name des Masters, unter diesem sind die Services erreichbar
     */
    Trajecmaster(std::string name);
    ///Dekonstruktor
    ~Trajecmaster();

    /** Funktion zum updaten aller Trajektorienhandler des Masters
     * @param [in] dt: Zeitintervall seit dem letzten aufruf der update-Funktion
     */
    void update(float dt);

    /**
     * Funktion zum Hinzufügen eines Trajektorienhandlers mit Crspline-Trajektorie
     * @param [in] name: name des Trajektorienhandlers
     * @param [in] points: Punkte der Trajektorie
     * @param [in] closed: Vorgabe ob offene oder geschlossene Trajektorie
     * @param [in] t: Startzeit für die Interne Zeit des Handlers
     * @param [in] k: Geschwindigkeit der Trajektorie
     */
    bool addCrsplineTrajectoryHandler(std::string name, std::vector<point> points, bool closed, float t, float k);
        /**
     * Funktion zum Hinzufügen eines Trajektorienhandlers mit Cspline-Trajektorie (bzw. linearer Interpolation)
     * @param [in] name: name des Trajektorienhandlers
     * @param [in] points: Punkte der Trajektorie
     * @param [in] T: Zeitwerte der einzelnen Punkte der Trajektorie (points und T benötigen gleiche Länge und min 3 Elemente)
     * @param [in] type: Typ der Trajektorie (tk::spline: linear, cspline oder cspline_hermite)
     * @param [in] closed: Vorgabe ob offene oder geschlossene Trajektorie
     * @param [in] t: Startzeit für die Interne Zeit des Handlers
     * @param [in] k: Geschwindigkeit der Trajektorie
     */
    bool addCSplineTrajectoryHandler(std::string name, std::vector<point> points, std::vector<double> T, tk::spline::spline_type type, bool closed, float t, float k);
        /**
     * Funktion zum Hinzufügen eines Trajektorienhandlers mit Kreis bzw. Ellipsen-Trajektorie
     * @param [in] name: name des Trajektorienhandlers
     * @param [in] mx: X-Koordinate des Mittelpunkts
     * @param [in] my: Y-Koordinate des Mittelpunkts
     * @param [in] a: Radius in X-Koordinatenrichtung
     * @param [in] b: radius in Y-Koordinatenrichtung (Kreis für a=b, ansonsten Ellipse)
     * @param [in] t: Startzeit für die Interne Zeit des Handlers
     * @param [in] k: Geschwindigkeit der Trajektorie
     */
    bool addCircleTrajectoryHandler(std::string name, float mx, float my, float a, float b, float t, float k);

    /**
     * Funktion zum entfernen eines Trajektorienhandlers aus den Master
     * @param[in] name: Name des zu entfernenden Handlers
     */
    bool removeTrajectoryHandler(std::string name);

private:

    ///Map mit den einzelnen TrajecHandlern des Masters (gespeichert mit den Namen)
    std::map<std::string, std::shared_ptr<Trajechandler>> trajecHandleMap;

    ///Nodehandler
    ros::NodeHandle nh;

    ///Name des Masters
    std::string name;

    //serivces:
    ///Service zum Hinzufügen eines Trajektorienhandlers für Kreis/Ellipsen-Bahnen
    ros::ServiceServer addCircleTrajHandl;
    ///Service zum Hinzufügen eines Trajektorienhandlers für Trajektorien aus der tk::spline Bibliothek
    ros::ServiceServer addCSplineTrajHandl;
    ///Service zum Hinzufügen eines Trajektorienhandlers für CR-Splines
    ros::ServiceServer addCrSplineTrajHandl;
    ///Service zum Entfernen eines Trajektorienhandlers
    ros::ServiceServer removeTrajHandl;
    ///Service zur Ausgabe aller namen der Trajectorienhandler des Masters
    ros::ServiceServer listTrajHandl;

    ///Callbackfunktionen für die Services
    bool addCircleTHCallback(trajecgenerator::addCircleTrajecHandler::Request&, trajecgenerator::addCircleTrajecHandler::Response&);
    bool addCSplineTHCallback(trajecgenerator::addCSplineTrajecHandler::Request&, trajecgenerator::addCSplineTrajecHandler::Response&);
    bool addCrSplineTHCallback(trajecgenerator::addCrSplineTrajecHandler::Request&, trajecgenerator::addCrSplineTrajecHandler::Response&);
    bool removeTHCallback(trajecgenerator::removeTrajecHandler::Request&, trajecgenerator::removeTrajecHandler::Response&);
    bool listTHCallback(std_srvs::Empty::Request&, std_srvs::Empty::Response&);
};


#endif //_TRAJECMASTER_H
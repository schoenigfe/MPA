#ifndef CRSPLINETRAJECTORY_H
#define CRSPLINETRAJECTORY_H

#include "trajectory.h"
#include "pos_d.h"
#include <vector>

/**
 * Klasse für Trajektorien basierend auf Catmull-Rom-Splines (Untermenge von Kubisch Hermitescher Splines)
 *  erbt von der Klasse Trajectory
 */
class Crsplinetrajectory : public Trajectory{

private:

    ///vektor mit den Punkten, durch die der Spline läuft
    std::vector<point> points;

    ///Legt fest, ob Trajektorie offen (false) oder geschlossen (true) ist, also wieder von vorne beginnt
    bool closed;

    /**
     * Funktion zur Berechnung der Punkte zur Spline berechnung aus dem points-Vektor
     * @param[in] t: Zeit
     */
    void calcPoints(point& p0, point& p1, point& p2, point& p3, float& t);

public:

    /**
     * Konstruktor
     * @param[in] closed: legt fest, ob der Spline offen oder geschlossen ist 
     */
    Crsplinetrajectory(bool closed);

    /**
     * Konstruktor
     * @param[in] points: Vector mit Punkten für den Spline
     * @param[in] closed: legt fest, ob der Spline offen oder geschlossen ist (Anmerkung: anders als bei cspline muss der erste und letzte punkt nicht identisch sein!)
     */
    Crsplinetrajectory(std::vector<point> points, bool closed);

    /**
     * Funktion für x und y Wert des Splines
     * @param[in] s: Kurvenparameter
     */
    virtual point getPoint(float s);
    /**
     * Funktion für die 1. Ableitung x und y Wert des Splines
     * @param[in] s: Kurvenparameter
     * @param[in] ds: 1. Ableitung des Kurvenparameters
     */
    virtual point getDeriv(float s, float ds);
    /**
     * Funktion für die 2. Ableitungen für x und y des Splines
     * @param[in] t: Zeit
     * @param[in] ds: 1. Ableitung des Kurvenparameters
     * @param[in] dds: 1. Ableitung des Kurvenparameters
     */
    virtual point getDeriv2(float s, float ds, float dds);
    /**
     * Funktion für die x und y sowie erste und zweite Ableitung des Splines
     * @param[in] t: Zeit
     * @param[in] ds: 1. Ableitung des Kurvenparameters
     * @param[in] dds: 1. Ableitung des Kurvenparameters
     */
    virtual pos_d getTrajec(float s, float ds, float dds);

    /**
     * Fügt zusätzlichen Punkt zum Spline hinzu (ans ende angehängt)
     * @param[in] p: Zusätzlicher Punkt
     */
    void addPoint(point p);

    /**
     * Gibt alle festgelegte Punkte des Splines zurück
     * @return: Vektor mit Punkten
     */
    std::vector<point> getPoints();

    /**
     * Gibt die anzahl der Punkte des Splines zurück
     * @return: Anzahl der Punkte
     */
    int getNumPoints();

    /**
     * Festlegen, ob Spline offen oder geschlossen ist
     * @param[in] closed: false: Spline ist offen; true: Spline ist geschlossen, d.h. nach dem Ende des splines beginnt er wieder von vorne
     */
    void setClosed(bool closed);

};

#endif //CRSPLINETRAJECTORY_H
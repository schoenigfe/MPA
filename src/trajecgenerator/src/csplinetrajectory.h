#ifndef CSPLINETRAJECTORY_H
#define CSPLINETRAJECTORY_H

#include "trajectory.h"
#include "pos_d.h"
#include <vector>
#include "spline.h"

/**
 * Klasse für Trajektorien basierend auf Spline-Library: https://github.com/ttk592/spline
 *      Erbt von der Klasse Trajectory
 */
class Csplinetrajectory : public Trajectory{

private:

    ///Legt fest, ob Trajektorie offen (false) oder geschlossen (true) ist, also wieder von vorne beginnt
    bool closed;

    ///Typ des Splines (linear, cspline, cspline_hermite)
    tk::spline::spline_type s_type;

    //mindestens 3 Elemente, T, X, Y alle gleich lang!
    ///Zeitvektor (muss aufsteigend sein):
    std::vector<double> T;
    ///X-Koordinaten der Punkte
    std::vector<double> X;
    ///Y-Koordinaten der Punkte
    std::vector<double> Y;    

    ///vektor mit den Punkten, durch die der Spline läuft
    std::vector<point> points;

    //Spline für X-Koordinaten
    std::unique_ptr<tk::spline> sx;
    //Spline für Y-Koordinaten
    std::unique_ptr<tk::spline> sy;

public:

    /**
     * Konstruktor
     * @param[in] points: Vector mit Punkten für den Spline
     * @param[in] T: Vector, mit Kurvenparameter entsprechend den einzelnen Punkten
     * @param[in] type: Typ des Splines
     * @param[in] closed: legt fest, ob der Spline offen oder geschlossen ist (damit das funktioniert muss der Erste und Letzte Punkt in points identisch sein!)
     */
    Csplinetrajectory(std::vector<point> points, std::vector<double> T, tk::spline::spline_type type, bool closed);

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
     * @param[in] s: Kurvenparameter des zusätzlichen Punkts (muss größer als Vorgänger sein!)
     */
    void addPoint(point p, float s);

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

#endif //CSPLINETRAJECTORY_H
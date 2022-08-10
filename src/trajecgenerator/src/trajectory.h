#ifndef _TRAJECTORY_H
#define _TRAJECTORY_H

#include <ros/ros.h>
#include "pos_d.h"
#include "gnuplot-iostream.h"

/**
 * Abstrakte Klasse für Trajektorien
 */
class Trajectory{

    public:

    ///Konstruktor
    Trajectory();
    ///Dekonstruktor
    ~Trajectory();

    /**
     * Funktion für x und y Wert des Splines
     * @param[in] s: Kurvenparameter
     */
    virtual point getPoint(float s) = 0;
    /**
     * Funktion für die 1. Ableitung x und y Wert des Splines
     * @param[in] s: Kurvenparameter
     * @param[in] ds: 1. Ableitung des Kurvenparameters
     */
    virtual point getDeriv(float s, float ds) = 0;
    /**
     * Funktion für die 2. Ableitungen für x und y des Splines
     * @param[in] s: Kurvenparameter
     * @param[in] ds: 1. Ableitung des Kurvenparameters
     * @param[in] dds: 1. Ableitung des Kurvenparameters
     */
    virtual point getDeriv2(float s, float ds, float dds) = 0;
    /**
     * Funktion für die x und y sowie erste und zweite Ableitung des Splines
     * @param[in] s: Kurvenparameter
     * @param[in] ds: 1. Ableitung des Kurvenparameters
     * @param[in] dds: 1. Ableitung des Kurvenparameters
     */
    virtual pos_d getTrajec(float s, float ds, float dds) = 0;

    ///Variable für Fensternummern, werden für die Plotfenster benötigt
    static unsigned int windowNum;

    ///Gnuplot Objekt zum Plotten
    static Gnuplot gp;

    ///enum zur Auswahl von X oder Y 
    enum x_or_y{
        x = 0,
        y = 1
    };

    /**
     * Funktion zum Plot der Trajektorie (Stellt verlauf der x bzw. y Koordinate der Trajektorie über die Zeit dar)
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
     * Funktion zum Plotten der Trajektorie (Stellt die Trajektorie in der Ebene dar)
     * @param [in] title: Titel des Plots
     * @param [in] maxT: Angabe der maximalen Zeit, über die geplottet wird (Zeit startet bei 0)
     * @param [in] dT: Schrittweite (Zeit) für den Plot
     * @param [in] k: Geschwindigkeit der Trajektorie
     * @param [in] xrang: Breite des Graphens in X-Richtung
     * @param [in] yrang: Breite des graphens in Y-Richtung
     */
    void plotTrajectory(std::string title, double maxT, double dT, float k, std::pair<double,double> xrange, std::pair<double,double> yrange);

    protected:

    //nodehandle 
    ros::NodeHandle nh;

};

#endif //_TRAJECTORY_H
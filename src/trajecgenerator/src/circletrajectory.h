#ifndef CIRCLETRAJECTORY_H
#define CIRCLETRAJECTORY_H

#include "trajectory.h"

/**
 * Klasse für kreisförmige, bzw. ellipsenförmige Trajektorien
 *  erbt von der Klasse Trajectory
 */
class Circletrajectory : public Trajectory{

public:

    /**
     * Konstruktor für Circletrajectory
     * @param[in] mx: X-Koordinate des Mittelpunkts des Kreis bzw. der Ellipse
     * @param[in] mx: Y-Koordinate des Mittelpunkts des Kreis bzw. der Ellipse
     * @param[in] a: Radius 1 (Halbachse in x-Koordinatenrichtung) (Kreis für a=b)
     * @param[in] b: Radius 2 (Halbachse in y-Koordinatenrichtung) (Kreis für a=b)
     */
    Circletrajectory(float mx, float my, float a, float b);
    /**
     * Dekonstruktor
     */
    ~Circletrajectory();

    /**
     * Funktion für x und y Wert des Splines zum Wert des Kurvenparameter
     * @param[in] phi: Kurvenparameter 
     */
    point getPoint(float phi);
    /**
     * Funktion für die 1. Ableitung x und y Wert des Kurvenparameter
     * @param[in] phi: Kurvenparameter 
     * @param[in] d_phi: 1. Ableitung des Kurvenparameters
     */
    point getDeriv(float phi, float d_phi=0);
    /**
     * Funktion für die 2. Ableitungen für x und y des Kurvenparameter
     * @param[in] phi: Kuvenparameter
     * @param[in] d_phi: 1. Ableitung des Kurvenparameters
     * @param[in] dd_phi: 2. Ableitung des Kurvenparameters
     */
    point getDeriv2(float phi, float d_phi=0, float dd_phi=0);
    /**
     * Funktion für die x und y sowie erste und zweite Ableitung des Splines zum Wert des Kurvenparameter
     * @param[in] phi: Kurvenparameter 
     * @param[in] d_phi: 1. Ableitung des Kurvenparameters
     * @param[in] dd_phi: 2. Ableitung des Kurvenparameters
     */
    pos_d getTrajec(float phi, float d_phi=0, float dd_phi=0);

private:
/**
 * mx: X-Koordinate des Kreismittelpunktes
 * my: Y-Koordinate des Kreismittelpunktes
 * a: Radius der Hauptachse der Ellipse (X-Richtung)
 * b: Radius der Nebenachse der Ellipse (Y-Richtung)
**/
float mx, my, a, b;
};



#endif //CIRCLETRAJECTORY_H
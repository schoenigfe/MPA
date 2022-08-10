/**
 * 2 häufiger verwendete Datentypen:
 */
#ifndef POS_D_H
#define POS_D_H

struct point{
    float x;
    float y;
};

struct pos_d{
  float x;
  float y;
  float dx;
  float dy;
  float ddx;
  float ddy;
  float theta;
};

#endif //POS_D_H
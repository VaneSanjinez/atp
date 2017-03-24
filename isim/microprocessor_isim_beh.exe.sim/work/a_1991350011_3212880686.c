/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Vane/Universidad/Noveno Semestre/Arquitectura de procesadores/microFinalProject/PC.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );


static void work_a_1991350011_3212880686_p_0(char *t0)
{
    char t11[16];
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;

LAB0:    xsi_set_current_line(47, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = *((unsigned char *)t3);
    t5 = (t4 == (unsigned char)3);
    if (t5 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1968U);
    t3 = *((char **)t2);
    t2 = (t0 + 3352);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t12 = (t8 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 24U);
    xsi_driver_first_trans_fast_port(t2);
    t2 = (t0 + 3272);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(48, ng0);
    t7 = (t0 + 1512U);
    t8 = *((char **)t7);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)3);
    if (t4 != 0)
        goto LAB11;

LAB12:
LAB9:    goto LAB3;

LAB5:    t2 = (t0 + 992U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB7;

LAB8:    xsi_set_current_line(49, ng0);
    t7 = (t0 + 1968U);
    t12 = *((char **)t7);
    t7 = (t0 + 5524U);
    t13 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t11, t12, t7, 1);
    t14 = (t0 + 1968U);
    t15 = *((char **)t14);
    t14 = (t15 + 0);
    t16 = (t11 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    memcpy(t14, t13, t18);
    goto LAB9;

LAB11:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1968U);
    t7 = *((char **)t2);
    t2 = (t0 + 3352);
    t8 = (t2 + 56U);
    t12 = *((char **)t8);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t7, 24U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB9;

}


extern void work_a_1991350011_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1991350011_3212880686_p_0};
	xsi_register_didat("work_a_1991350011_3212880686", "isim/microprocessor_isim_beh.exe.sim/work/a_1991350011_3212880686.didat");
	xsi_register_executes(pe);
}

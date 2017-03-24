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
static const char *ng0 = "C:/Vane/Universidad/Noveno Semestre/Arquitectura de procesadores/microFinalProject/RAM.vhd";
extern char *IEEE_P_3620187407;

int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_3830602496_3212880686_p_0(char *t0)
{
    unsigned char t1;
    char *t2;
    char *t3;
    unsigned char t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    xsi_set_current_line(55, ng0);
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
LAB3:    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2128U);
    t3 = *((char **)t2);
    t2 = (t0 + 1512U);
    t7 = *((char **)t2);
    t2 = (t0 + 6184U);
    t11 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t7, t2);
    t15 = (t11 - 255);
    t12 = (t15 * -1);
    xsi_vhdl_check_range_of_index(255, 0, -1, t11);
    t13 = (24U * t12);
    t14 = (0 + t13);
    t8 = (t3 + t14);
    t9 = (t0 + 3512);
    t10 = (t9 + 56U);
    t16 = *((char **)t10);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t8, 24U);
    xsi_driver_first_trans_fast_port(t9);
    t2 = (t0 + 3432);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(60, ng0);
    t7 = (t0 + 12419);
    t9 = (t0 + 2128U);
    t10 = *((char **)t9);
    t11 = (2 - 255);
    t12 = (t11 * -1);
    t13 = (24U * t12);
    t14 = (0 + t13);
    t9 = (t10 + t14);
    memcpy(t9, t7, 24U);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 12443);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t11 = (3 - 255);
    t12 = (t11 * -1);
    t13 = (24U * t12);
    t14 = (0 + t13);
    t7 = (t8 + t14);
    memcpy(t7, t2, 24U);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 12467);
    t7 = (t0 + 2128U);
    t8 = *((char **)t7);
    t11 = (4 - 255);
    t12 = (t11 * -1);
    t13 = (24U * t12);
    t14 = (0 + t13);
    t7 = (t8 + t14);
    memcpy(t7, t2, 24U);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1672U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)3);
    if (t4 != 0)
        goto LAB8;

LAB10:
LAB9:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 1832U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t4 = (t1 == (unsigned char)3);
    if (t4 != 0)
        goto LAB11;

LAB13:
LAB12:    goto LAB3;

LAB5:    t2 = (t0 + 992U);
    t6 = xsi_signal_has_event(t2);
    t1 = t6;
    goto LAB7;

LAB8:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2128U);
    t7 = *((char **)t2);
    t2 = (t0 + 1512U);
    t8 = *((char **)t2);
    t2 = (t0 + 6184U);
    t11 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t8, t2);
    t15 = (t11 - 255);
    t12 = (t15 * -1);
    xsi_vhdl_check_range_of_index(255, 0, -1, t11);
    t13 = (24U * t12);
    t14 = (0 + t13);
    t9 = (t7 + t14);
    t10 = (t0 + 3512);
    t16 = (t10 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    memcpy(t19, t9, 24U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB9;

LAB11:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1192U);
    t7 = *((char **)t2);
    t2 = (t0 + 2128U);
    t8 = *((char **)t2);
    t2 = (t0 + 1512U);
    t9 = *((char **)t2);
    t2 = (t0 + 6184U);
    t11 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t2);
    t15 = (t11 - 255);
    t12 = (t15 * -1);
    xsi_vhdl_check_range_of_index(255, 0, -1, t11);
    t13 = (24U * t12);
    t14 = (0 + t13);
    t10 = (t8 + t14);
    memcpy(t10, t7, 24U);
    goto LAB12;

}


extern void work_a_3830602496_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3830602496_3212880686_p_0};
	xsi_register_didat("work_a_3830602496_3212880686", "isim/micro_tb_isim_beh.exe.sim/work/a_3830602496_3212880686.didat");
	xsi_register_executes(pe);
}

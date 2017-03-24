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
static const char *ng0 = "C:/Vane/Universidad/Noveno Semestre/Arquitectura de procesadores/microFinalProject/ALU.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1547198987_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1919437128_1035706684(char *, char *, char *, char *, int );
char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t41[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t32;
    int t34;
    char *t35;
    int t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t42;
    unsigned int t43;

LAB0:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 2368U);
    t4 = *((char **)t2);
    t2 = (t0 + 3752);
    t5 = (t2 + 56U);
    t8 = *((char **)t5);
    t9 = (t8 + 56U);
    t11 = *((char **)t9);
    memcpy(t11, t4, 8U);
    xsi_driver_first_trans_fast_port(t2);
    t2 = (t0 + 3672);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(53, ng0);
    t4 = (t0 + 1672U);
    t8 = *((char **)t4);
    t4 = (t0 + 6406);
    t10 = xsi_mem_cmp(t4, t8, 4U);
    if (t10 == 1)
        goto LAB9;

LAB20:    t11 = (t0 + 6410);
    t13 = xsi_mem_cmp(t11, t8, 4U);
    if (t13 == 1)
        goto LAB10;

LAB21:    t14 = (t0 + 6414);
    t16 = xsi_mem_cmp(t14, t8, 4U);
    if (t16 == 1)
        goto LAB11;

LAB22:    t17 = (t0 + 6418);
    t19 = xsi_mem_cmp(t17, t8, 4U);
    if (t19 == 1)
        goto LAB12;

LAB23:    t20 = (t0 + 6422);
    t22 = xsi_mem_cmp(t20, t8, 4U);
    if (t22 == 1)
        goto LAB13;

LAB24:    t23 = (t0 + 6426);
    t25 = xsi_mem_cmp(t23, t8, 4U);
    if (t25 == 1)
        goto LAB14;

LAB25:    t26 = (t0 + 6430);
    t28 = xsi_mem_cmp(t26, t8, 4U);
    if (t28 == 1)
        goto LAB15;

LAB26:    t29 = (t0 + 6434);
    t31 = xsi_mem_cmp(t29, t8, 4U);
    if (t31 == 1)
        goto LAB16;

LAB27:    t32 = (t0 + 6438);
    t34 = xsi_mem_cmp(t32, t8, 4U);
    if (t34 == 1)
        goto LAB17;

LAB28:    t35 = (t0 + 6442);
    t37 = xsi_mem_cmp(t35, t8, 4U);
    if (t37 == 1)
        goto LAB18;

LAB29:
LAB19:
LAB8:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 1192U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB40;

LAB42:
LAB41:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB9:    xsi_set_current_line(55, ng0);
    t38 = (t0 + 1352U);
    t39 = *((char **)t38);
    t38 = (t0 + 2128U);
    t40 = *((char **)t38);
    t38 = (t40 + 0);
    memcpy(t38, t39, 8U);
    goto LAB8;

LAB10:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t2 = (t0 + 2248U);
    t5 = *((char **)t2);
    t2 = (t5 + 0);
    memcpy(t2, t4, 8U);
    goto LAB8;

LAB11:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t2 = (t0 + 6304U);
    t5 = (t0 + 2248U);
    t8 = *((char **)t5);
    t5 = (t0 + 6320U);
    t9 = ieee_p_1242562249_sub_1547198987_1035706684(IEEE_P_1242562249, t41, t4, t2, t8, t5);
    t11 = (t0 + 2368U);
    t12 = *((char **)t11);
    t11 = (t12 + 0);
    t14 = (t41 + 12U);
    t42 = *((unsigned int *)t14);
    t43 = (1U * t42);
    memcpy(t11, t9, t43);
    goto LAB8;

LAB12:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t2 = (t0 + 6304U);
    t5 = (t0 + 2248U);
    t8 = *((char **)t5);
    t5 = (t0 + 6320U);
    t9 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t41, t4, t2, t8, t5);
    t11 = (t0 + 2368U);
    t12 = *((char **)t11);
    t11 = (t12 + 0);
    t14 = (t41 + 12U);
    t42 = *((unsigned int *)t14);
    t43 = (1U * t42);
    memcpy(t11, t9, t43);
    goto LAB8;

LAB13:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t2 = (t0 + 6304U);
    t5 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t41, t4, t2);
    t8 = (t0 + 2368U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t11 = (t41 + 12U);
    t42 = *((unsigned int *)t11);
    t43 = (1U * t42);
    memcpy(t8, t5, t43);
    goto LAB8;

LAB14:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 2248U);
    t4 = *((char **)t2);
    t2 = (t0 + 6320U);
    t5 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t41, t4, t2);
    t8 = (t0 + 2368U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t11 = (t41 + 12U);
    t42 = *((unsigned int *)t11);
    t43 = (1U * t42);
    memcpy(t8, t5, t43);
    goto LAB8;

LAB15:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t2 = (t0 + 6304U);
    t5 = ieee_p_1242562249_sub_1919437128_1035706684(IEEE_P_1242562249, t41, t4, t2, 1);
    t8 = (t0 + 2368U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t11 = (t41 + 12U);
    t42 = *((unsigned int *)t11);
    t43 = (1U * t42);
    memcpy(t8, t5, t43);
    goto LAB8;

LAB16:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t2 = (t0 + 2248U);
    t5 = *((char **)t2);
    t1 = 1;
    if (8U == 8U)
        goto LAB34;

LAB35:    t1 = 0;

LAB36:    if (t1 != 0)
        goto LAB31;

LAB33:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 6454);
    t5 = (t0 + 2368U);
    t8 = *((char **)t5);
    t5 = (t8 + 0);
    memcpy(t5, t2, 8U);

LAB32:    goto LAB8;

LAB17:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t2 = (t0 + 6304U);
    t5 = (t0 + 2248U);
    t8 = *((char **)t5);
    t5 = (t0 + 6320U);
    t9 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t41, t4, t2, t8, t5);
    t11 = (t0 + 2368U);
    t12 = *((char **)t11);
    t11 = (t12 + 0);
    t14 = (t41 + 12U);
    t42 = *((unsigned int *)t14);
    t43 = (1U * t42);
    memcpy(t11, t9, t43);
    goto LAB8;

LAB18:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 2128U);
    t4 = *((char **)t2);
    t2 = (t0 + 6304U);
    t5 = (t0 + 2248U);
    t8 = *((char **)t5);
    t5 = (t0 + 6320U);
    t9 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t41, t4, t2, t8, t5);
    t11 = (t0 + 2368U);
    t12 = *((char **)t11);
    t11 = (t12 + 0);
    t14 = (t41 + 12U);
    t42 = *((unsigned int *)t14);
    t43 = (1U * t42);
    memcpy(t11, t9, t43);
    goto LAB8;

LAB30:;
LAB31:    xsi_set_current_line(70, ng0);
    t9 = (t0 + 6446);
    t12 = (t0 + 2368U);
    t14 = *((char **)t12);
    t12 = (t14 + 0);
    memcpy(t12, t9, 8U);
    goto LAB32;

LAB34:    t42 = 0;

LAB37:    if (t42 < 8U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t2 = (t4 + t42);
    t8 = (t5 + t42);
    if (*((unsigned char *)t2) != *((unsigned char *)t8))
        goto LAB35;

LAB39:    t42 = (t42 + 1);
    goto LAB37;

LAB40:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 2368U);
    t5 = *((char **)t2);
    t2 = (t0 + 3752);
    t8 = (t2 + 56U);
    t9 = *((char **)t8);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t5, 8U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB41;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/micro_tb_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}

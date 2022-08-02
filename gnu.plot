set encoding utf8 

LINEWIDTH = 2.0
POINTSIZE = .42

set style line 1  lt 1 lc rgb '#1F78B4'  lw LINEWIDTH pt 7 ps POINTSIZE pointinterval 0
set style line 19  lt 1 lc rgb '#991F78B4'  lw LINEWIDTH pt 7 ps POINTSIZE pointinterval 0
set style line 2  linetype 1 linecolor rgb '#8856a7' linewidth LINEWIDTH pointtype 7 pointsize POINTSIZE pointinterval 0
set style line 9  lt 1 lc rgb '#5a5a5a'  lw LINEWIDTH pt 7 ps POINTSIZE pointinterval 0
set style line 10  lt 2 lc 'gray'  lw LINEWIDTH pt 7 ps POINTSIZE pointinterval 0
set style line 30  lt 1 lc rgb '#d7191c'  lw LINEWIDTH pt 7 ps default pointinterval 0



set key spacing 1.4
set key samplen 8
set key top left

set xlabel 'bond length/Å'
set ylabel 'binding energy/eV'

set g


set xrange [1.48:3.30] 






set multiplot

set yrange [-1.62:-0.4]
plot 'pes_exp_casey.dat' ls 1 smooth csplines t "Casey/Leopold: Expt. fit",\
'pes_exp_err.dat' u 1:3:2 w filledcurves fillstyle noborder ls 19 t "Expt. error estimate",\
'pes_exp_new_fit.dat' ls 2  dt 4 w l t "This work: Expt. new fit",\
'pes_theory.dat'  u 1:2 ls 30 smooth csplines  t 'This work: Theory',\
'pes_theory_points.dat'  u 1:2:3 w yerrorbar ls 30 notitle

set object 1 rectangle from screen 0.58,0.13 to screen 0.58+0.34,0.12+0.31 behind fillstyle solid noborder fillcolor "white" 
set key top center
set key samplen 1
unset grid

unset label 
set xrange [1.48:3.30]
set ytics 0.2
set xtics 0.4

set size 0.38,0.32
set origin 0.57,0.12


set xlabel ""
set ylabel ""
plot 'pes_exp_new_fit.dat' ls 2 lw 2  dt 4 w l notitle,\
'pes_theory.dat'  u 1:2 ls 30  lw 2  smooth csplines notitle,\
'pes_li.dat'  u 1:2 ls 9 lw 2  smooth csplines  t "Li et al.: Theory"
unset multiplot


pause -1

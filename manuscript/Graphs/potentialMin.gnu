reset
#==========================================================
set terminal epslatex standalone color dl 3 lw 2 size 3.5,2.62
set terminal epslatex "Times-Roman" 14
set output "tmp.tex"

set yrange [0:1.5]
set xrange [1.5:10]
set xlabel "$\\Lambda$ [fm$^{-1}$]"
set ylabel "$R$ [fm]"

#set key box width .5 height 1. spacing 1.8 b r
set key spacing 1.4
set key at graph 0.95, graph 0.95

set style line 1 lc rgb '#21618C' lw 2.5 ps 1.5 pt 7
set style line 2 lc rgb '#A93226' dt (4,4,4,4) lw 2.5 ps 1.5 pt 7
set style line 3 lc rgb '#186A3B' dt (4,4,4,4) lw 2.5 ps 2.5 pt 7

#set ytics 0,-20,-100  format "$%g$" nomirror
set xtics 0,2,10    format "$%g$" nomirror
#set format x '$%g$'

plot "full_rgm_potential_MaxMin.dat" u (2*($1)**0.5):2  ls 1 w l t "$R(\\textrm{barrier})$",\
     "full_rgm_potential_MaxMin.dat" u (2*($1)**0.5):4  ls 2 w l t "$R(\\textrm{valley})$"

set output
! latex tmp.tex && dvipdf tmp.dvi
! mv tmp.pdf rgm_potential_MinMax.pdf
! rm tmp.*

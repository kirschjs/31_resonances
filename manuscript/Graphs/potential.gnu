reset
#==========================================================
set terminal epslatex standalone color dl 3 lw 2 size 3.5,2.62
set terminal epslatex "Times-Roman" 14
set output "tmp.tex"

#set yrange [0:60]
#set xrange [0:4]
set xlabel "$R$ [fm]"
set ylabel "$V_{R=R'}$ [MeV]"

#set key box width .5 height 1. spacing 1.8 b r
set key spacing 1.4
set key at graph 0.95, graph 0.95

set style line 1 lc rgb '#21618C' lw 4.5 ps 1.5 pt 7
set style line 2 lc rgb '#A93226' lw 2.5 ps 2.0 pt 7
set style line 3 lc rgb '#186A3B' dt (4,4,4,4) lw 1.5 ps 2.5 pt 7

#set ytics 0,20,120  format "$%g$" nomirror
#set xtics 0,0.5,2    format "$%g$" nomirror
#set format x '$%g$'

#g1(x) =  e1/x/x
#fit g1(x) 'XXX.dat' using 1:2 via e1
#g2(x) =  e2/x/x
#fit g2(x) 'XXX.dat' using 1:3 via e2
#g3(x) =  e3/x/x
#fit g3(x) 'XXX.dat' using 1:4 via e3
#set grid front

#set obj rect from 1, -45 to 2, -2.1 fc rgb "gray80" fs solid noborder


plot "rgm_pot_full_diag_unitary.dat" u 1:2  ls 1 w l t "$\\Lambda=1.5~\\textrm{fm}^{-1}$",\
     "rgm_pot_full_diag_unitary.dat" u 1:7  ls 2 w l t "$\\Lambda=10~\\textrm{fm}^{-1}$",\
     "rgm_pot_full_diag_unitary.dat" u 1:3  ls 3 w l t "",\
     "rgm_pot_full_diag_unitary.dat" u 1:4  ls 3 w l t "",\
     "rgm_pot_full_diag_unitary.dat" u 1:5  ls 3 w l t "",\
     "rgm_pot_full_diag_unitary.dat" u 1:6  ls 3 w l t ""

set output
! latex tmp.tex && dvipdf tmp.dvi
! mv tmp.pdf rgm_potential_unit.pdf
! rm tmp.*

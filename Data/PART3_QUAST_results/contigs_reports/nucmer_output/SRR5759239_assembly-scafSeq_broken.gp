set terminal canvas jsdir ""
set output "/home/svenbuerki/Documents/Kmers_analyses/Quast/quast_results/results_2019_04_02_12_21_49/contigs_reports/nucmer_output/SRR5759239_assembly-scafSeq_broken.html"
set xtics rotate ( \
 "0" 0, \
 "40000000" 40000000, \
 "80000000" 80000000, \
 "120000000" 120000000, \
 "160000000" 160000000, \
 "200000000" 200000000, \
 "240000000" 240000000, \
 "280000000" 280000000, \
 "320000000" 320000000, \
 "" 322899837 \
)
set ytics ( \
 "0" 0, \
 "40000000" 40000000, \
 "80000000" 80000000, \
 "120000000" 120000000, \
 "160000000" 160000000, \
 "200000000" 200000000, \
 "240000000" 240000000, \
 "" 274794774 \
)
set size 1,1
set grid
set key outside bottom right
set border 0
set tics scale 0
set xlabel "Reference" noenhanced
set ylabel "Assembly" noenhanced
set format "%.0f"
set xrange [1:322899837]
set yrange [1:274794774]
set linestyle 1  lt 1 lc rgb "red" lw 3 pt 7 ps 0.5
set linestyle 2  lt 3 lc rgb "blue" lw 3 pt 7 ps 0.5
set linestyle 3  lt 2 lc rgb "yellow" lw 3 pt 7 ps 0.5
plot \
 "/home/svenbuerki/Documents/Kmers_analyses/Quast/quast_results/results_2019_04_02_12_21_49/contigs_reports/nucmer_output/SRR5759239_assembly-scafSeq_broken.fplot" title "FWD" w lp ls 1, \
 "/home/svenbuerki/Documents/Kmers_analyses/Quast/quast_results/results_2019_04_02_12_21_49/contigs_reports/nucmer_output/SRR5759239_assembly-scafSeq_broken.rplot" title "REV" w lp ls 2

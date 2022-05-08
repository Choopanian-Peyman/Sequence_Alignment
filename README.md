# Sequence_Alignment

Sequence alignment by dynamic programming.

This repository contain Matlab code for global sequence alignment by Needleman/Wunsch method which using dynamic programming. 


The Needleman–Wunsch algorithm is an algorithm used in bioinformatics to align protein or nucleotide sequences. This and related algorithms have been in use since then for the detection of similarities and the alignment of sequence information from protein families. The dynamic programming algorithm finds the optimal alignment through the construction of a score matrix. The path which resulted in the score in the last row/column is traced back in reverse to generate the alignment. It was one of the first applications of dynamic programming to compare biological sequences. The algorithm was developed by Saul B. Needleman and Christian D. Wunsch and published in 1970. The algorithm essentially divides a large problem (e.g. the full sequence) into a series of smaller problems, and it uses the solutions to the smaller problems to find an optimal solution to the larger problem. It is also sometimes referred to as the optimal matching algorithm and the global alignment technique. The Needleman–Wunsch algorithm is still widely used for optimal global alignment, particularly when the quality of the global alignment is of the utmost importance. The algorithm assigns a score to every possible alignment, and the purpose of the algorithm is to find all possible alignments having the highest score.

Since the algorithm for two sequences of length n and m fills an n*m table, thus the time complexity of the algorithm is O(mn).



Ref:
 [1] Needleman, Saul B. & Wunsch, Christian D. (1970).
        "A general method applicable to the search for similarities in the amino acid sequence of two proteins".
		Journal of Molecular Biology. 48 (3): 443–53. doi:10.1016/0022-2836(70)90057-4. PMID 5420325.

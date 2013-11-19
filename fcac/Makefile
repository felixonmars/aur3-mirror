LIB = -l fcac

libfcac.so: 
	gcc -shared -fpic -o $@ \
	comb_norep_lex.c comb_rep_lex.c comb_norep_revcolex.c comb_rep_revcolex.c k_comp_colex.c k_part_colex.c neck_lex.c part_revlex.c perm_rep_lex.c vari_rep_colex.c vari_rep_lex.c


example:libfcac.so
	gcc -o comb_norep_revcolex_example comb_norep_revcolex_example.c -L. $(LIB) 
	gcc -o comb_norep_lex_example      comb_norep_lex_example.c -L. $(LIB) 
	gcc -o comb_rep_lex_example        comb_rep_lex_example.c -L. $(LIB) 
	gcc -o comb_rep_revcolex_example   comb_rep_revcolex_example.c -L. $(LIB) 
	gcc -o k_comp_colex_example        k_comp_colex_example.c -L. $(LIB) 
	gcc -o k_part_colex_example        k_part_colex_example.c -L. $(LIB) 
	gcc -o neck_lex_example            neck_lex_example.c -L. $(LIB) 
	gcc -o part_revlex_example         part_revlex_example.c -L. $(LIB) 
	gcc -o perm_rep_lex_example        perm_rep_lex_example.c -L. $(LIB) 
	gcc -o vari_rep_colex_example      vari_rep_colex_example.c -L. $(LIB) 
	gcc -o vari_rep_lex_example        vari_rep_lex_example.c -L. $(LIB) 


clean:
	rm -f *.o *.so k_comp_colex_example    k_part_colex_example    neck_lex_example        part_revlex_example     perm_rep_lex_example    vari_rep_colex_example  vari_rep_lex_example    comb_norep_lex_example     comb_rep_lex_example       comb_rep_revcolex_example  comb_norep_revcolex_example 

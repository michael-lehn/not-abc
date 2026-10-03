CC := abc
CFLAGS += -O3 
DEPFLAGS += -MD -MF $(dep.dir)/$(<F).d \
	    -MT $(@:$(cpp.dir)/%.abc_cpp=$(obj.dir)/%.o) -MP

LDFLAGS += 

dep.dir := dep
obj.dir := obj

target_src := $(wildcard x*.abc)
target_obj := $(target_src:%.abc=$(obj.dir)/%.o)
target := $(patsubst %.o,%,$(notdir $(target_obj)))

common_src := $(filter-out $(target_src), $(wildcard *.abc))
common_obj := $(common_src:%.abc=$(obj.dir)/%.o)

dep := $(gen_src:%=$(dep.dir)/%.d) \
       $(common_src:%=$(dep.dir)/%.d) \
       $(target_src:%=$(dep.dir)/%.d)

$(obj.dir)/%.o : %.abc | $(obj.dir) $(dep.dir)
	$(CC) -c $(CFLAGS) $(DEPFLAGS) $< -o $@

.DEFAULT_GOAL := all

$(dep.dir): ; mkdir -p $@
$(obj.dir): ; mkdir -p $@

.PHONY: all
all: $(target) $(common_obj) $(target_obj) $(ulm.tools)

%: $(obj.dir)/%.o $(common_obj)
	abc -o $@ $^

.PHONY: tree.tex
tree.tex: xtest_parser
	@echo '\\documentclass[preview, margin=0.2cm]{standalone}' > tree.tex
	@echo '\\usepackage{forest}' >> tree.tex
	@echo '\\begin{document}' >> tree.tex
	@echo '\\begin{forest}' >> tree.tex
	@echo 'Type an expression (use Control-D for EOI):'
	./xtest_parser >> tree.tex
	@echo '\\end{forest}' >> tree.tex
	@echo '\\end{document}' >> tree.tex
	@echo "Generated 'tree.tex'"
	@echo
	@echo "Next two things to do:"
	@echo "1) run 'lualatex tree.tex' to generate 'tree.pdf'"
	@echo "2) run 'open tree.pdf' to view 'tree.pdf'"

.PHONY: clean
clean:
	$(RM) $(target)
	$(RM) -rf $(dep.dir) $(obj.dir)

$(dep):
-include $(dep)

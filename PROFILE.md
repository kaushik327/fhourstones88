# Profiling
```
make C476
sudo perf record -g --call-graph=dwarf ./C476 < test-inputs
sudo perf report --stdio --no-children -g graph,0.5,caller
```

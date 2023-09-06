using Pkg
using DataFrames
using CSVFiles
using DelimitedFiles

temperatura = readdlm("temp.csv",',')
mes = readdlm("mes.csv",',')


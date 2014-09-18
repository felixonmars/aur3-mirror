--[[
place me to src/torch-svm-master after package installed
run:
luajit test.lua
or
lua5.1 test.lua
or
torch test.lua

--]]
svm = require 'svm'

d = svm.ascread('liblinear/liblinear/heart_scale')
model = liblinear.train(d)
labels,accuracy,dec = liblinear.predict(d,model)


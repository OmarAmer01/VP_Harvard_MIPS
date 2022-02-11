import pandas as pd

testVector = pd.read_csv("G:\VP\hdl\ALU/testVector.txt", sep="_",header=None)
fromALU = pd.read_csv("G:\VP\hdl\ALU/aluOut.txt", sep="_",header=None)
fromCode = pd.read_csv("G:\VP\hdl\ALU/resultVectorPY.txt", sep="_",header=None)
view = pd.concat([testVector, fromALU, fromCode], axis=1)

view.columns = ['A', 'B', 'OP', 'ALU_RES', 'ALU_CARRY','ALU_SIGN', 'ALU_ZERO','ALU_RESX', 'CODE_RES', 'CODE_CARRY', 'CODE_SIGN', 'CODE_ZERO', 'CODE_RESX']
mul = view[view.OP == 'b']
detMul = pd.merge(mul['ALU_RES'], mul['ALU_RESX'],mul['CODE_RES'], mul['CODE_RESX'])
print(mul)

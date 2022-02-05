import pandas as pd

testVector = pd.read_csv("G:\VP\hdl\ALU/testVector.txt", sep="_",header=None)
fromALU = pd.read_csv("G:\VP\hdl\ALU/aluOut.txt", sep="_",header=None)
fromCode = pd.read_csv("G:\VP\hdl\ALU/resultVectorPY.txt", sep="_",header=None)
view = pd.concat([testVector, fromALU, fromCode], axis=1)

view.columns = ['A', 'B', 'OP', 'ALU_RES', 'ALU_CARRY','ALU_SIGN', 'ALU_ZERO', 'CODE_RES', 'CODE_CARRY', 'CODE_SIGN', 'CODE_ZERO']
diff = view[(view.ALU_SIGN != view.CODE_SIGN)]
print(view[view.OP == 'a'])

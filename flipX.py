import sys
import os
import shutil
from dipy.io import read_bvals_bvecs

ifn = sys.argv[1]
ofn = sys.argv[2]

print("Saving ", ifn, " as ", ofn , " and saving ", ifn, "back with X with sign flipped")
def writeBvec(bvec, path):
    writeString = "\n".join([" ".join([str(n) for n in vec]) for vec in bvec.transpose()])
    with open(path, 'w') as f:
        f.write(writeString)

# Save a copy of the file
shutil.copyfile(ifn,ofn)
# Read the file
bvec = read_bvals_bvecs(None, ifn)[1]
# Flip X
whereToFlip = 0
bvec[:, whereToFlip] = -bvec[:, whereToFlip]
#outPath = os.path.join(archivPath, f"{originalName}_correctedBy{flipDict[whereToFlip]}.bvecs")
writeBvec(bvec, ifn)

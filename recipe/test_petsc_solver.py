"""Exercise the packaged complex PETSc eigensolver in serial and MPI."""
import numpy as np
from mpi4py import MPI
from petsc4py import PETSc
from slepc4py import SLEPc
from edrixs.petsc_backend.petsc_backend import ed_petsc

assert np.issubdtype(PETSc.ScalarType, np.complexfloating)
assert PETSc.COMM_WORLD.getSize() == MPI.COMM_WORLD.size

def matrix():
    mat = PETSc.Mat().createAIJ([8, 8], nnz=1, comm=PETSc.COMM_WORLD)
    start, stop = mat.getOwnershipRange()
    for row in range(start, stop):
        mat[row, row] = row + 1
    mat.assemble()
    return mat

values, vectors = ed_petsc(matrix, num_evals=2)
np.testing.assert_allclose(values, [1., 2.], atol=1e-7)
for vector in vectors:
    vector.destroy()
print("PETSc solver passed", PETSc.Sys.getVersion(), SLEPc.Sys.getVersion())

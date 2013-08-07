cdef extern from "stdlib.h":
    void free(void* ptr)
    void* malloc(size_t size)
    void* realloc(void* ptr, size_t size)


cdef extern from *:
    ctypedef int One "1"    # a fake type
    ctypedef int Two "2"    # a fake type
    ctypedef int Three "3"    # a fake type
    ctypedef int Four "4"    # a fake type
    ctypedef int Five "5"    # a fake type



cdef extern from "blitz/array.h" namespace "blitz":
    cdef cppclass TinyVector[T, xxx]:
        cppclass iterator:
            T operator*()
            iterator operator++()
            bint operator==(iterator)
            bint operator!=(iterator)
        TinyVector() except +
        TinyVector(T value) except +
        TinyVector(T value1, T value2) except +
        TinyVector(T value1, T value2, T value3) except +
        TinyVector(T value1, T value2, T value3, T value4) except +
        iterator begin() except +
        iterator end() except +
        T *data()

    enum preexistingMemoryPolicy:
        duplicateData
        deleteDataWhenDone
        neverDeleteData


ctypedef TinyVector[int, Two] shape_t


cdef extern from "blitz/array.h" namespace "blitz":
    cdef cppclass Array[T, xxx]:
        Array() except +
        Array(T value) except +
        Array(T value1, T value2) except +
        Array(T value1, T value2, T value3) except +
        Array(T value1, T value2, T value3, T value4) except +
        Array(Array &other) except +
        Array(T *data_first, TinyVector[T, xxx] shape,
              preexistingMemoryPolicy delete_policy) except +
        T *data()
        int rank() const
        int extent(int) const
        shape_t shape() const


cdef extern from "blitz_helpers.hpp":
    void dump_blitz(Array[unsigned int, Two] *array)
    Array[unsigned int, Two] *wrap_blitz(Array[unsigned int, Two] *array)

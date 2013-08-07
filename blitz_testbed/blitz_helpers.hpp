#ifndef ___BLITZ_TEST__HPP___
#define ___BLITZ_TEST__HPP___

#include <iostream>
#include "blitz/array.h"

namespace {

using namespace blitz;

template<class T, int N>
Array<T, N> *wrap_blitz(Array<T, N> *array) {
    return new Array<T, N>(*array);
}

template<class T, int N>
inline void dump_blitz(Array<T, N> *array) {
    (*array) = 5;
    std::cout << (*array) << std::endl;
}

}

#endif

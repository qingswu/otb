#
# Copyright (C) 2005-2017 Centre National d'Etudes Spatiales (CNES)
#
# This file is part of Orfeo Toolbox
#
#     https://www.orfeo-toolbox.org/
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

INCLUDE_ONCE_MACRO(OTB)

SETUP_SUPERBUILD(OTB)

set(OTB_SB_SRC ${CMAKE_SOURCE_DIR}/..)

ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB GDAL OSSIM ITK TINYXML BOOST)

##get_property(OTB_DEPENDENCIES GLOBAL PROPERTY GLOBAL_OTB_DEPENDENCIES)

if(OTB_USE_CURL)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB CURL)
  ADD_SUPERBUILD_CMAKE_VAR(OTB CURL_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB CURL_LIBRARY)
endif()

if(OTB_USE_LIBKML)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB LIBKML)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBKML_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBKML_BASE_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBKML_CONVENIENCE_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBKML_DOM_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBKML_ENGINE_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBKML_REGIONATOR_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBKML_XSD_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBKML_MINIZIP_LIBRARY)
endif()

if(OTB_USE_OPENCV)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB OPENCV)
  ADD_SUPERBUILD_CMAKE_VAR(OTB OpenCV_DIR)
endif()

if(OTB_USE_SHARK)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB SHARK)
  ADD_SUPERBUILD_CMAKE_VAR(OTB Shark_DIR)
endif()

if(OTB_USE_LIBSVM)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB LIBSVM)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBSVM_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB LIBSVM_LIBRARY)
endif()

if(OTB_USE_MUPARSER)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB MUPARSER)
  ADD_SUPERBUILD_CMAKE_VAR(OTB MUPARSER_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB MUPARSER_LIBRARY)
endif()

if(OTB_USE_MUPARSERX)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB MUPARSERX)
  ADD_SUPERBUILD_CMAKE_VAR(OTB MUPARSERX_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB MUPARSERX_LIBRARY)
endif()

if(OTB_WRAP_PYTHON OR OTB_WRAP_JAVA OR OTB_WRAP_PYTHON3)
  ADD_SUPERBUILD_CMAKE_VAR(OTB SWIG_EXECUTABLE)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB SWIG)
endif()

if(OTB_WRAP_PYTHON)
  ADD_SUPERBUILD_CMAKE_VAR(OTB PYTHON_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB PYTHON_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OTB PYTHON_EXECUTABLE)
endif()

if(OTB_WRAP_PYTHON3)
  ADD_SUPERBUILD_CMAKE_VAR(OTB PYTHON3_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB PYTHON3_LIBRARY)
  ADD_SUPERBUILD_CMAKE_VAR(OTB PYTHON3_EXECUTABLE)
endif()

if(OTB_USE_QT4)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB QT4)
endif()

if(OTB_USE_GLEW)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB GLEW)
  ADD_SUPERBUILD_CMAKE_VAR(OTB GLEW_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB GLEW_LIBRARY)
endif()

if(OTB_USE_GLFW)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB GLFW)
  #check with RK before enabling it again (clean up to be done)
  # ADD_SUPERBUILD_CMAKE_VAR(OTB GLFW_INCLUDE_DIR)
  # ADD_SUPERBUILD_CMAKE_VAR(OTB GLFW_LIBRARY)
endif()

if(OTB_USE_GLUT)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB GLUT)
  ADD_SUPERBUILD_CMAKE_VAR(OTB GLUT_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB GLUT_LIBRARY)
endif()

if(OTB_USE_QWT)
  ADDTO_DEPENDENCIES_IF_NOT_SYSTEM(OTB QWT)
  ADD_SUPERBUILD_CMAKE_VAR(OTB QWT_INCLUDE_DIR)
  ADD_SUPERBUILD_CMAKE_VAR(OTB QWT_LIBRARY)
endif()

ADD_SUPERBUILD_CMAKE_VAR(OTB GDAL_INCLUDE_DIR)
ADD_SUPERBUILD_CMAKE_VAR(OTB GDAL_LIBRARY)

ADD_SUPERBUILD_CMAKE_VAR(OTB OSSIM_INCLUDE_DIR)
ADD_SUPERBUILD_CMAKE_VAR(OTB OSSIM_LIBRARY)

ADD_SUPERBUILD_CMAKE_VAR(OTB ITK_DIR)

ADD_SUPERBUILD_CMAKE_VAR(OTB TINYXML_INCLUDE_DIR)
ADD_SUPERBUILD_CMAKE_VAR(OTB TINYXML_LIBRARY)

ADD_SUPERBUILD_CMAKE_VAR(OTB Boost_INCLUDE_DIR)
ADD_SUPERBUILD_CMAKE_VAR(OTB Boost_LIBRARY_DIR)


set(OTB_MODULES_CONFIG)
if(WITH_REMOTE_MODULES)
  foreach(remote_module SertitObject Mosaic otbGRM OTBFFSforGMM)
    list(APPEND OTB_MODULES_CONFIG -DModule_${remote_module}:BOOL=ON)
  endforeach()
else()
  set(OTB_MODULES_CONFIG)
endif()


add_custom_command(OUTPUT otb_depends_done.txt
  COMMAND cmake -E touch otb_depends_done.txt
  DEPENDS ${OTB_DEPENDENCIES}
  )

add_custom_target(OTB_DEPENDS
  DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/otb_depends_done.txt
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
  COMMENT "Built all otb dependencies: ${OTB_DEPENDENCIES}"
  VERBATIM
  )


ExternalProject_Add(OTB
  DEPENDS ${OTB_DEPENDENCIES}
  PREFIX OTB
  DOWNLOAD_COMMAND ""
  SOURCE_DIR ${OTB_SB_SRC}
  BINARY_DIR ${OTB_SB_BUILD_DIR}
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  DOWNLOAD_DIR ${DOWNLOAD_LOCATION}
  CMAKE_CACHE_ARGS
  ${SB_CMAKE_CACHE_ARGS}
  ${OTB_MODULES_CONFIG}
  -DBUILD_TESTING:BOOL=${BUILD_TESTING}
  -DBUILD_EXAMPLES:BOOL=${BUILD_EXAMPLES}
  -DOTB_DATA_ROOT:STRING=${OTB_DATA_ROOT}
  -DOTB_DATA_USE_LARGEINPUT:BOOL=${OTB_DATA_USE_LARGEINPUT}
  -DOTB_DATA_LARGEINPUT_ROOT:PATH=${OTB_DATA_LARGEINPUT_ROOT}
  -DOTB_USE_6S:BOOL=${OTB_USE_6S}
  -DOTB_USE_CURL:BOOL=${OTB_USE_CURL}
  -DOTB_USE_LIBKML:BOOL=${OTB_USE_LIBKML}
  -DOTB_USE_LIBSVM:BOOL=${OTB_USE_LIBSVM}
  -DOTB_USE_MAPNIK:BOOL=${OTB_USE_MAPNIK}
  -DOTB_USE_MUPARSER:BOOL=${OTB_USE_MUPARSER}
  -DOTB_USE_MUPARSERX:BOOL=${OTB_USE_MUPARSERX}
  -DOTB_USE_OPENCV:BOOL=${OTB_USE_OPENCV}
  -DOTB_USE_SHARK:BOOL=${OTB_USE_SHARK}
  -DOTB_USE_QT4:BOOL=${OTB_USE_QT4}
  -DOTB_USE_SIFTFAST:BOOL=${OTB_USE_SIFTFAST}
  -DOTB_USE_OPENGL:BOOL=${OTB_USE_OPENGL}
  -DOTB_USE_GLEW:BOOL=${OTB_USE_GLEW}
  -DOTB_USE_GLFW:BOOL=${OTB_USE_GLFW}
  -DOTB_USE_GLUT:BOOL=${OTB_USE_GLUT}
  -DOTB_USE_QWT:BOOL=${OTB_USE_QWT}
  -DOTB_USE_OPENMP:BOOL=${OTB_USE_OPENMP}
  -DOTB_WRAP_PYTHON:BOOL=${OTB_WRAP_PYTHON}
  -DOTB_WRAP_PYTHON3:BOOL=${OTB_WRAP_PYTHON3}
  -DOTB_WRAP_JAVA:BOOL=${OTB_WRAP_JAVA}
  ${OTB_ADDITIONAL_CACHE}
  CMAKE_ARGS ${OTB_SB_CONFIG}
  CMAKE_COMMAND ${SB_CMAKE_COMMAND}
  LOG_CONFIGURE 1
  )


ExternalProject_Add_Step(
  OTB install_copyright
  COMMAND ${CMAKE_COMMAND} -E copy
  ${OTB_SB_SRC}/LICENSE ${CMAKE_INSTALL_PREFIX}/share/copyright/LICENSE

  COMMAND ${CMAKE_COMMAND} -E copy
  ${OTB_SB_SRC}/NOTICE ${CMAKE_INSTALL_PREFIX}/share/copyright/NOTICE
  
  COMMAND ${CMAKE_COMMAND}
  -E copy_directory
  ${CMAKE_SOURCE_DIR}/Copyright ${CMAKE_INSTALL_PREFIX}/share/copyright
  DEPENDEES install
  )

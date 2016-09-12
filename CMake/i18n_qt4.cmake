#
# Reset Qt I18N source files cache variable.
macro( reset_qt4_i18n_sources )
  set( OTB_QT_I18N_INCLUDE_PATH "" CACHE INTERNAL "" FORCE )
  set( OTB_QT_I18N_HEADER_FILES "" CACHE INTERNAL "" FORCE )
  set( OTB_QT_I18N_SOURCE_FILES "" CACHE INTERNAL "" FORCE )
  set( OTB_QT_I18N_FORM_FILES "" CACHE INTERNAL "" FORCE )
endmacro()

# string( REPLACE ".cxx" ".h" OTB_QT_I18N_HEADER_FILES OTB_QT_I18N_SOURCE_FILES )

# string( REPLACE ".cxx" ".ui" OTB_QT_I18N_HEADER_FILES OTB_QT_I18N_SOURCE_FILES )

#
# Func
function( add_to_qt4_i18n_files RESULT )
  foreach( F ${ARGN} )
    #message( "${F}" )

    get_filename_component( ABS_FILE ${F} ABSOLUTE )

    set( ${RESULT}
      "${${RESULT}} ${ABS_FILE}"
      CACHE INTERNAL "" FORCE
      )
  endforeach()
endfunction()

#
#
macro( add_to_qt4_i18n_include_path DIRECTORY )
  set( OTB_I18N_INCLUDE_PATH
    "${OTB_I18N_INCLUDE_PATH} ${DIRECTORY}"
    CACHE INTERNAL "" FORCE
    )
endmacro()

#
#
macro( add_to_qt4_i18n_headers INCLUDE_DIR )

  get_filename_component( ABS_INCLUDE_DIR ${INCLUDE_DIR} ABSOLUTE )

  set( OTB_QT_I18N_INCLUDE_PATH
    "${OTB_QT_I18N_INCLUDE_PATH} ${ABS_INCLUDE_DIR}"
    CACHE INTERNAL "" FORCE
    )


  foreach( F ${ARGN} )
    string( REPLACE ".cxx" ".h" HEADER ${F} )

    list( APPEND HEADERS ${HEADER} )
  endforeach()


  #message( "HEADERS=${HEADERS}" )


  foreach( F ${HEADERS} )
    #message( "F=${F}" )

    set( ABS_FILE "${ABS_INCLUDE_DIR}/${F}" )

    if( EXISTS ${ABS_FILE} )
      set( OTB_QT_I18N_HEADER_FILES
	"${OTB_QT_I18N_HEADER_FILES} ${ABS_FILE}"
	CACHE INTERNAL "" FORCE
	)
    endif()
  endforeach()
endmacro()

#
# Add source files to Qt I18n translation build.
macro( add_to_qt4_i18n_sources )
  add_to_qt4_i18n_files( OTB_QT_I18N_SOURCE_FILES ${ARGN} )
endmacro()

#
# Add source files to Qt I18n translation build.
macro( add_to_qt4_i18n_forms )
  add_to_qt4_i18n_files( OTB_QT_I18N_FORM_FILES ${ARGN} )
endmacro()

#
#
macro( generate_qt4_project TRANSLATIONS FILENAME )
  message( STATUS "Generating Qt4 '${FILENAME}' project file for I18N." )

  file( WRITE
    ${FILENAME}

    "# OTB autogenerated .pro file needed to generate Qt I18N translations

INCLUDEPATH = ${OTB_QT_I18N_INCLUDE_PATH}

HEADERS = ${OTB_QT_I18N_HEADER_FILES}

SOURCES = ${OTB_QT_I18N_SOURCE_FILES}

FORMS = ${OTB_QT_I18N_FORM_FILES}

TRANSLATIONS = ${TRANSLATIONS}"
    )
endmacro()

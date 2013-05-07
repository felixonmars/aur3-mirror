
find_package(KDE4 REQUIRED)
include(KDE4Defaults)

FIND_PROGRAM(GETTEXT_MSGFMT_EXECUTABLE msgfmt)
 
IF(NOT GETTEXT_MSGFMT_EXECUTABLE)
	MESSAGE(
"------
                 NOTE: msgfmt not found. Translations will *not* be compiled
------")
ELSE(NOT GETTEXT_MSGFMT_EXECUTABLE)
	ADD_CUSTOM_TARGET(translations ALL)

	SET(LANGUAGES br cz de en_GB es et fr ga it ja km lt mai nds nl pt pt_BR sk sv tr uk)
	SET(catalognames 
		libpublictransporthelper 
		plasma_applet_publictransport
		plasma_applet_graphicaltimetableline
		plasma_applet_flights 
		plasma_engine_publictransport 
		plasma_runner_publictransport
		timetablemate)

	file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/output)
	FOREACH(_langCode ${LANGUAGES})
		IF( EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${_langCode} )
			file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/output/${_langCode})

			FOREACH(catalogname ${catalognames})
				IF( EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${_langCode}/${catalogname}.po )
					SET(_poFile ${CMAKE_CURRENT_SOURCE_DIR}/${_langCode}/${catalogname}.po)
					SET(_moFile ${CMAKE_CURRENT_BINARY_DIR}/output/${_langCode}/${catalogname}.mo)
					ADD_CUSTOM_COMMAND(TARGET translations
							COMMAND ${GETTEXT_MSGFMT_EXECUTABLE} --check -o ${_moFile} ${_poFile}
							DEPENDS ${_poFile})
					INSTALL( FILES ${_moFile} DESTINATION ${LOCALE_INSTALL_DIR}/${_langCode}/LC_MESSAGES/ )
				ENDIF( EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${_langCode}/${catalogname}.po )
			ENDFOREACH(catalogname ${catalognames})
		ENDIF( EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/${_langCode} )
	ENDFOREACH(_langCode ${LANGUAGES})
ENDIF(NOT GETTEXT_MSGFMT_EXECUTABLE)

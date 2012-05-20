if (ENABLE_TABLE)
    add_subdirectory(table)
endif (ENABLE_TABLE)

add_subdirectory(script)
add_subdirectory(icon)

set(FCITX_DESC_FILES
    addon.desc
    config.desc
    profile.desc
    inputmethod.desc
)

set(FCITX_DATA_FILES
    AutoEng.dat
    gbks2t.tab
    punc.mb.zh_CN
    punc.mb.zh_HK
    punc.mb.zh_TW
    vk.conf
)

set(FCITX_DSEKTOP_FILES
    fcitx.desktop
    fcitx-configtool.desktop
)

intltool_merge_translation(${CMAKE_CURRENT_SOURCE_DIR}/fcitx-configtool.desktop.in ${CMAKE_CURRENT_BINARY_DIR}/fcitx-configtool.desktop )
intltool_merge_translation(${CMAKE_CURRENT_SOURCE_DIR}/fcitx.desktop.in ${CMAKE_CURRENT_BINARY_DIR}/fcitx.desktop )

add_custom_target(desktopfile ALL DEPENDS ${FCITX_DSEKTOP_FILES})
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/fcitx.desktop DESTINATION share/applications/)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/fcitx-configtool.desktop DESTINATION share/applications/)

install(FILES ${FCITX_DATA_FILES} DESTINATION ${pkgdatadir}/data)
fcitx_add_configdesc_file(${FCITX_DESC_FILES})

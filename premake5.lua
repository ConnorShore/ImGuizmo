project "ImGuizmo"
    kind "StaticLib"
    language "C++"
    cppdialect "C++23"
    staticruntime "off"
    
    multiprocessorcompile "On"

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "ImGuizmo.h",
        "ImGuizmo.cpp"
    }

    includedirs {
        ".",
        -- CRITICAL: ImGuizmo needs to find imgui.h and imgui_internal.h
        -- Adjust this path to point to wherever your ImGui submodule lives
        -- relative to your workspace root!
        "%{wks.location}/Ember/vendor/imgui" 
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        defines "EB_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "EB_RELEASE"
        runtime "Release"
        optimize "on"
        
    filter "configurations:Dist"
        runtime "Release"
        staticruntime "on"
        optimize "on"
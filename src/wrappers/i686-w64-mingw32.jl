# Autogenerated wrapper script for MbedTLS_jll for i686-w64-mingw32
export libmbedx509, libmbedcrypto, libmbedtls

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"

# Relative path to `libmbedx509`
const libmbedx509_splitpath = ["bin", "libmbedx509.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmbedx509_path = ""

# libmbedx509-specific global declaration
# This will be filled out by __init__()
libmbedx509_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmbedx509 = "libmbedx509.dll"


# Relative path to `libmbedcrypto`
const libmbedcrypto_splitpath = ["bin", "libmbedcrypto.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmbedcrypto_path = ""

# libmbedcrypto-specific global declaration
# This will be filled out by __init__()
libmbedcrypto_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmbedcrypto = "libmbedcrypto.dll"


# Relative path to `libmbedtls`
const libmbedtls_splitpath = ["bin", "libmbedtls.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmbedtls_path = ""

# libmbedtls-specific global declaration
# This will be filled out by __init__()
libmbedtls_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmbedtls = "libmbedtls.dll"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libmbedx509_path = abspath(joinpath(artifact"MbedTLS", libmbedx509_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmbedx509_handle = dlopen(libmbedx509_path)
    push!(LIBPATH_list, dirname(libmbedx509_path))

    global libmbedcrypto_path = abspath(joinpath(artifact"MbedTLS", libmbedcrypto_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmbedcrypto_handle = dlopen(libmbedcrypto_path)
    push!(LIBPATH_list, dirname(libmbedcrypto_path))

    global libmbedtls_path = abspath(joinpath(artifact"MbedTLS", libmbedtls_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmbedtls_handle = dlopen(libmbedtls_path)
    push!(LIBPATH_list, dirname(libmbedtls_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()


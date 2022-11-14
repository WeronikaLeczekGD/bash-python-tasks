import sys

def get_extension(filename):
    
    try:
        extension = filename.split(".")[1]
        print(extension)
    except IndexError:
        print("No extension found")
        raise
    except:
        print("Unexpected error:", sys.exc_info()[0])
    
get_extension("extension.txt")

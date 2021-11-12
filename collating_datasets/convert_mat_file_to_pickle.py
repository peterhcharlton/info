# CONVERT_MAT_FILE_TO_PICKLE  Converts a MATLAB file to a pickle file.
#   
#  Inputs:
#
#    file    -  a MATLAB file
#
#  Outputs:
#
#    file    -  a pickle file
#
#  Preparation:
#
#    Modify this Python script by inserting the 'file_name' of the file to be converted
#    (and ensure that this script is in the same folder as that file)
#
#  Acknowledgment: this script is inspired by the scripts provided at:
#
#   https://www.galaxysofts.com/new/python-pickle-file-to-matlab-mat-file-converter/
#   https://ianlondon.github.io/blog/pickling-basics/
#
#  Licence:
#       Available under the MIT License - please see the accompanying
#       file named "MIT_LICENSE.txt"
#
# Author: Peter H. Charlton, Nov 2021.

import numpy as np, scipy.io
import pickle, sys
import matplotlib.pyplot as plt

##### Setup filenames
file_name = "sig_sample"
source_name = file_name + ".mat"
dest_name = file_name + ".pkl"

create_mat_file = 1
if create_mat_file:
    ##### Create a matlab file containing a sine wave
    t = np.arange(0, 20, 0.1)
    a = np.sin(t)
    scipy.io.savemat(source_name, mdict={'sig': a})
    
##### Load Matlab file	
b = scipy.io.loadmat(source_name)
b = b['sig']    # this is used to load a Matlab variable called 'sig', which in this case is a row vector.
b = b[0,:]

# Plot the Matlab data
plt.plot(b, label='Original data')
plt.ylabel('value')
plt.xlabel('Time (s)')

# Save it as a pickle file
with open(dest_name, 'wb') as f:
    pickle.dump(b, f)

# check that what's been saved is the same as the original data
do_check = 1
if do_check:
    
    # Load the pickle file
    with open(dest_name, "rb") as f:
        c = pickle.load(f)
        
    # plot the loaded data
    offset = (max(c)-min(c))/5
    plt.plot(offset+c, label='Re-loaded data (shifted for clarity)')
    plt.ylabel('value')
    plt.xlabel('Time (s)')
    plt.legend()
        

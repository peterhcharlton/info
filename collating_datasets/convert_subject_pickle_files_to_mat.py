# CONVERT_SUBJECT_PICKLE_FILES_TO_MAT  Converts individual subjects' data files (in pickle format) into a MATLAB file.
#   
#  Inputs:
#
#    file    -  a pickle file for an individual subject in the WESAD or PPG-DaLiA
#                dataset. Details of how to obtain these are 
#                provided at: https://peterhcharlton.github.io/resources/datasets
#
#  Outputs:
#
#    file    -  a MATLAB file for this subject
#
#  Preparation:
#
#    Modify this Python script by inserting the 'file_name' of the file to be converted
#    (and ensure that this script is in the same folder as that file)
#
#  Further information: 
#
#   https://peterhcharlton.github.io/resources/datasets
#
#  Acknowledgment: this script is based on the script provided at:
#
#   https://www.galaxysofts.com/new/python-pickle-file-to-matlab-mat-file-converter/
#
#  Licence:
#       Available under the MIT License - please see the accompanying
#       file named "MIT_LICENSE.txt"
#
# Author: Peter H. Charlton, May 2021.

import numpy, scipy.io
import pickle, sys

file_name = "S2"
source_name = file_name + ".pkl"
dest_name = file_name + ".mat"
	
a=pickle.load( open( source_name, "rb" ), encoding='latin1')

scipy.io.savemat(dest_name, mdict={'pickle_data': a})
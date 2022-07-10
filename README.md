# eDNAExplorer
Code repository for the eDNAExplorer

Step 1. Upload metadata forms for planned samples and sequences. Sample data can be uploaded before sequence data, and sample environmental data can be obtained from the eDNA explorer without providing sequence data.

Step 2. (Jim codes) option for downloading a csv or text file of the metadata the eDNA Explorer automatically associated with their samples
 
 Case study 1. Someone uploads locations prior to collections so we have no temporal window
    Collection date is required in addition to location in order for the Explorer to generate enviro metadata for the user. Message user that more information is needed from them but that what they have shared so far is secure.
 
 Case study 2. Someone uploads locations and dates of environmental sample collections. They may or may not have GPS uncertainty
    Message the user that uncertainty is missing in list of X samples, and ask them to approve a 100m default uncertainty buffer around the points.
 
 Case study 3. Someone uploads locations, dates, sequence file names, and all other associated metadata about the sequences
   Use the median value of uncertainty buffer to create the pixel size for downloading environmental data from Google Earth Engine etc.
   
 Webpage need: a site that teaches people about the environmental data we gave them back
 
 Link to metadata layers is here: https://docs.google.com/spreadsheets/d/1Q1pF6x-xNHHnI5Z1UphuJEHKz2J-buRz4uwv9zuVZKk/edit?usp=sharing
 Link to copy on metadata layers is here: https://docs.google.com/document/d/1PiPXPBVxLiBY7sudj8p1CYaIJ1eKZFKjawkFV_dP-8I/edit?usp=sharing
 
 Step 3. User uploads fastq data
   use the fastq_upload script that generated md5checksum and confirms forward and reverse sequence files are the same number of lines.
 

#!/usr/bin/python

'''
Created on 30-Dec-2015

@author: omkar
'''

from flask import Flask
import sys
import getopt

app = Flask(__name__)

#Routes
@app.route('/')
def index():
    return "Hello World!"


def usage():
    print 'application.py -h <host ip> -p <port> -d <debug True/False>'

#Main function
def main(argv):
    
    #Default values
    host = "0.0.0.0"
    port = "50000"
    debug = True
    
    print "Command line arguments ", argv
    
    try:
        opts, args = getopt.getopt(argv,"hpd:",["host=","port=", "debug="])
    except getopt.GetoptError:
        usage()
        sys.exit(2)
      
    for opt, arg in opts:
        if opt in ("-h", "--host"):
            host = arg
        elif opt in ("-p", "--port"):
            port = arg
        elif opt in ("-d", "--debug"):
            debug = arg
          
    app.run(host=host, port=int(port), debug=debug)
    


if __name__ == '__main__':
    main(sys.argv[1:]) #Send all parameters except 1st

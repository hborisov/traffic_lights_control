import urllib2
import xml.etree.ElementTree
from operator import itemgetter, attrgetter, methodcaller

baseurl = 'http://dewdfgwp01572.wdf.sap.corp:9090/makelogs/rpcm/sequence/logs/idm_d_stream/'
timestamp = urllib2.urlopen('http://dewdfgwp01572.wdf.sap.corp:9090/makelogs/rpcm/sequence/logs/idm_d_stream/all.jml').read()
projects = ['idm_environment_idm_d_stream','com.sap.idm.ic_idm_d_stream','com.sap.idm.wdui_idm_d_stream','com.sap.idm.rest_idm_d_stream','com.sap.idm.vds_idm_d_stream','com.sap.idm.test_idm_d_stream','com.sap.idm.core_idm_d_stream']
urlsuffix = '/project.xml'

def sortchildrenby(parent, attr):
    parent[:] = sorted(parent, key=lambda child: child.get(attr), reverse=True)

def getstatus(url):
	page = urllib2.urlopen(url).read()

	e = xml.etree.ElementTree.fromstring(page)
	tasks = e.find('build').findall('task')

	sortchildrenby(tasks, 'idx')
	print tasks[0].get('status')


for project in projects:
	ur = baseurl + timestamp + project + urlsuffix
	print ur

// Provide a default path to dwr.engine
if (dwr == null) var dwr = {};
if (dwr.engine == null) dwr.engine = {};
if (DWREngine == null) var DWREngine = dwr.engine;

if (GlobalDwr == null) var GlobalDwr = {};
GlobalDwr._path = '/dwr';
GlobalDwr.setUserPreference = function(p2, p3, callback) {
  dwr.engine._execute(GlobalDwr._path, 'GlobalDwr', 'setUserPreference', false, false, p2, p3, callback);
}
GlobalDwr.getConfigParameterValues = function(p2, callback) {
  dwr.engine._execute(GlobalDwr._path, 'GlobalDwr', 'getConfigParameterValues', false, false, p2, callback);
}

/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/weddings.jsx");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/weddings.jsx":
/*!*******************************************!*\
  !*** ./app/javascript/packs/weddings.jsx ***!
  \*******************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /home/cristi/Desktop/projects/wedding-application/app/javascript/packs/weddings.jsx: Unexpected token (51:22)\n\n  49 |       return (\n  50 |         <div key={index} data-id={response.id} className=\"user-item\" onClick={ this.toggleSelectedUser.bind(this) }>\n> 51 |           <img src= {<%= avatar_for(current_user, size: 35) %>} className=\"user-picture\" data-id={response.id} />\n     |                       ^\n  52 |           <h2 className=\"user-name\" data-id={response.id}>{response.name}</h2>\n  53 |         </div>\n  54 |       )\n    at Object.raise (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3851:17)\n    at Object.unexpected (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5167:16)\n    at Object.jsxParseIdentifier (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3350:12)\n    at Object.jsxParseNamespacedName (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3360:23)\n    at Object.jsxParseElementName (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3371:21)\n    at Object.jsxParseOpeningElementAt (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3456:22)\n    at Object.jsxParseElementAt (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3489:33)\n    at Object.jsxParseElement (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3558:17)\n    at Object.parseExprAtom (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3565:19)\n    at Object.parseExprSubscripts (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5914:23)\n    at Object.parseMaybeUnary (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5894:21)\n    at Object.parseExprOps (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5781:23)\n    at Object.parseMaybeConditional (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5754:23)\n    at Object.parseMaybeAssign (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5701:21)\n    at Object.parseExpression (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5649:23)\n    at Object.jsxParseExpressionContainer (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3426:30)\n    at Object.jsxParseAttributeValue (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3388:21)\n    at Object.jsxParseAttribute (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3444:44)\n    at Object.jsxParseOpeningElementAfterName (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3464:28)\n    at Object.jsxParseOpeningElementAt (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3457:17)\n    at Object.jsxParseElementAt (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3489:33)\n    at Object.jsxParseElementAt (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3505:32)\n    at Object.jsxParseElement (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3558:17)\n    at Object.parseExprAtom (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:3565:19)\n    at Object.parseExprSubscripts (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5914:23)\n    at Object.parseMaybeUnary (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5894:21)\n    at Object.parseExprOps (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5781:23)\n    at Object.parseMaybeConditional (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5754:23)\n    at Object.parseMaybeAssign (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:5701:21)\n    at Object.parseParenAndDistinguishExpression (/home/cristi/Desktop/projects/wedding-application/node_modules/@babel/parser/lib/index.js:6466:28)");

/***/ })

/******/ });
//# sourceMappingURL=weddings-1ae7da65bad081550655.js.map
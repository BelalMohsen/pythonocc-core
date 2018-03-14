/*
Copyright 2008-2018 Thomas Paviot (tpaviot@gmail.com)


This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%define RESOURCEDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=RESOURCEDOCSTRING) Resource

#pragma SWIG nowarn=504,325,503

%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i


%include Resource_headers.i


%pythoncode {
def register_handle(handle, base_object):
    """
    Inserts the handle into the base object to
    prevent memory corruption in certain cases
    """
    try:
        if base_object.IsKind("Standard_Transient"):
            base_object.thisHandle = handle
            base_object.thisown = False
    except:
        pass
};

/* typedefs */
/* end typedefs declaration */

/* templates */
%define Handle(Class) opencascade::handle<Class>
%enddef
%template(Resource_DataMapOfAsciiStringAsciiString) NCollection_DataMap <TCollection_AsciiString , TCollection_AsciiString , TCollection_AsciiString>;
%template(Resource_DataMapOfAsciiStringExtendedString) NCollection_DataMap <TCollection_AsciiString , TCollection_ExtendedString , TCollection_AsciiString>;
%template(Resource_DataMapIteratorOfDataMapOfAsciiStringExtendedString) NCollection_TListIterator<Resource_DataMapOfAsciiStringExtendedString>;
%template(Resource_DataMapIteratorOfDataMapOfAsciiStringAsciiString) NCollection_TListIterator<Resource_DataMapOfAsciiStringAsciiString>;
/* end templates declaration */

/* public enums */
enum Resource_FormatType {
	Resource_SJIS = 0,
	Resource_EUC = 1,
	Resource_ANSI = 2,
	Resource_GB = 3,
};

/* end public enums declaration */

%nodefaultctor Resource_LexicalCompare;
class Resource_LexicalCompare {
	public:
		%feature("compactdefaultargs") Resource_LexicalCompare;
		%feature("autodoc", "	:rtype: None
") Resource_LexicalCompare;
		 Resource_LexicalCompare ();
		%feature("compactdefaultargs") IsLower;
		%feature("autodoc", "	* Returns True if <Left> is lower than <Right>.

	:param Left:
	:type Left: TCollection_AsciiString &
	:param Right:
	:type Right: TCollection_AsciiString &
	:rtype: bool
") IsLower;
		Standard_Boolean IsLower (const TCollection_AsciiString & Left,const TCollection_AsciiString & Right);
};


%extend Resource_LexicalCompare {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Resource_Manager;
class Resource_Manager : public Standard_Transient {
	public:
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "	* Create a Resource manager. Attempts to find the two following files: $CSF_`aName`Defaults/aName $CSF_`aName`UserDefaults/aName and load them respectively into a reference and a user resource structure. //! If CSF_ResourceVerbose defined, seeked files will be printed. //! FILE SYNTAX The syntax of a resource file is a sequence of resource lines terminated by newline characters or end of file. The syntax of an individual resource line is:

	:param aName:
	:type aName: char *
	:param Verbose: default value is Standard_False
	:type Verbose: bool
	:rtype: None
") Resource_Manager;
		 Resource_Manager (const char * aName,const Standard_Boolean Verbose = Standard_False);
		%feature("compactdefaultargs") Resource_Manager;
		%feature("autodoc", "	:param aName:
	:type aName: char *
	:param aDefaultsDirectory:
	:type aDefaultsDirectory: TCollection_AsciiString &
	:param anUserDefaultsDirectory:
	:type anUserDefaultsDirectory: TCollection_AsciiString &
	:param Verbose: default value is Standard_False
	:type Verbose: bool
	:rtype: None
") Resource_Manager;
		 Resource_Manager (const char * aName,TCollection_AsciiString & aDefaultsDirectory,TCollection_AsciiString & anUserDefaultsDirectory,const Standard_Boolean Verbose = Standard_False);
		%feature("compactdefaultargs") Save;
		%feature("autodoc", "	* Save the user resource structure in the specified file. Creates the file if it does not exist.

	:rtype: bool
") Save;
		Standard_Boolean Save ();
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	* returns True if the Resource does exist.

	:param aResource:
	:type aResource: char *
	:rtype: bool
") Find;
		Standard_Boolean Find (const char * aResource);
		%feature("compactdefaultargs") Integer;
		%feature("autodoc", "	* Gets the value of an integer resource according to its instance and its type.

	:param aResourceName:
	:type aResourceName: char *
	:rtype: int
") Integer;
		virtual Standard_Integer Integer (const char * aResourceName);
		%feature("compactdefaultargs") Real;
		%feature("autodoc", "	* Gets the value of a real resource according to its instance and its type.

	:param aResourceName:
	:type aResourceName: char *
	:rtype: float
") Real;
		virtual Standard_Real Real (const char * aResourceName);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Gets the value of a CString resource according to its instance and its type.

	:param aResourceName:
	:type aResourceName: char *
	:rtype: char *
") Value;
		virtual const char * Value (const char * aResourceName);
		%feature("compactdefaultargs") ExtValue;
		%feature("autodoc", "	* Gets the value of an ExtString resource according to its instance and its type.

	:param aResourceName:
	:type aResourceName: char *
	:rtype: Standard_ExtString
") ExtValue;
		virtual Standard_ExtString ExtValue (const char * aResourceName);
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "	* Sets the new value of an integer resource. If the resource does not exist, it is created.

	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: int
	:rtype: void
") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_Integer aValue);
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "	* Sets the new value of a real resource. If the resource does not exist, it is created.

	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: float
	:rtype: void
") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_Real aValue);
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "	* Sets the new value of an CString resource. If the resource does not exist, it is created.

	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: char *
	:rtype: void
") SetResource;
		virtual void SetResource (const char * aResourceName,const char * aValue);
		%feature("compactdefaultargs") SetResource;
		%feature("autodoc", "	* Sets the new value of an ExtString resource. If the resource does not exist, it is created.

	:param aResourceName:
	:type aResourceName: char *
	:param aValue:
	:type aValue: Standard_ExtString
	:rtype: void
") SetResource;
		virtual void SetResource (const char * aResourceName,const Standard_ExtString aValue);
		%feature("compactdefaultargs") GetResourcePath;
		%feature("autodoc", "	* Gets the resource file full path by its name. If corresponding environment variable is not set or file doesn't exist returns empty string.

	:param aPath:
	:type aPath: TCollection_AsciiString &
	:param aName:
	:type aName: char *
	:param isUserDefaults:
	:type isUserDefaults: bool
	:rtype: void
") GetResourcePath;
		static void GetResourcePath (TCollection_AsciiString & aPath,const char * aName,const Standard_Boolean isUserDefaults);
};


%extend Resource_Manager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Resource_Manager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Resource_Manager::Handle_Resource_Manager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Resource_Manager;
class Handle_Resource_Manager : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_Resource_Manager();
        Handle_Resource_Manager(const Handle_Resource_Manager &aHandle);
        Handle_Resource_Manager(const Resource_Manager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Resource_Manager DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_Resource_Manager {
    Resource_Manager* _get_reference() {
    return (Resource_Manager*)$self->get();
    }
};

%extend Handle_Resource_Manager {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend Resource_Manager {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class Resource_Unicode {
	public:
		%feature("compactdefaultargs") ConvertSJISToUnicode;
		%feature("autodoc", "	* Converts non-ASCII CString <fromstr> in SJIS format to Unicode ExtendedString <tostr>.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertSJISToUnicode;
		static void ConvertSJISToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertEUCToUnicode;
		%feature("autodoc", "	* Converts non-ASCII CString <fromstr> in EUC format to Unicode ExtendedString <tostr>.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertEUCToUnicode;
		static void ConvertEUCToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertGBToUnicode;
		%feature("autodoc", "	* Converts non-ASCII CString <fromstr> in GB format to Unicode ExtendedString <tostr>.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertGBToUnicode;
		static void ConvertGBToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertANSIToUnicode;
		%feature("autodoc", "	* Converts non-ASCII CString <fromstr> in ANSI format to Unicode ExtendedString <tostr>.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertANSIToUnicode;
		static void ConvertANSIToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertUnicodeToSJIS;
		%feature("autodoc", "	* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in SJIS format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToSJIS;
		static Standard_Boolean ConvertUnicodeToSJIS (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
		%feature("compactdefaultargs") ConvertUnicodeToEUC;
		%feature("autodoc", "	* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in EUC format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToEUC;
		static Standard_Boolean ConvertUnicodeToEUC (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
		%feature("compactdefaultargs") ConvertUnicodeToGB;
		%feature("autodoc", "	* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in GB format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToGB;
		static Standard_Boolean ConvertUnicodeToGB (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
		%feature("compactdefaultargs") ConvertUnicodeToANSI;
		%feature("autodoc", "	* Converts Unicode ExtendedString <fromstr> to non-ASCII CString <tostr> in ANSI format, limited to <maxsize> characters. To translate the whole <fromstr>, use more than twice the length of <fromstr>. Returns true if <maxsize> has not been reached before end of conversion.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToANSI;
		static Standard_Boolean ConvertUnicodeToANSI (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "	* Defines the current conversion format as typecode. This conversion format will then be used by the functions ConvertFormatToUnicode and ConvertUnicodeToFormat to convert the strings.

	:param typecode:
	:type typecode: Resource_FormatType
	:rtype: void
") SetFormat;
		static void SetFormat (const Resource_FormatType typecode);
		%feature("compactdefaultargs") GetFormat;
		%feature("autodoc", "	* Returns the current conversion format --either ANSI, EUC, GB or SJIS--. The current converting format must be defined in advance with the SetFormat function.

	:rtype: Resource_FormatType
") GetFormat;
		static Resource_FormatType GetFormat ();
		%feature("compactdefaultargs") ReadFormat;
		%feature("autodoc", "	* Reads converting format from resource 'FormatType' in Resource Manager 'CharSet'

	:rtype: void
") ReadFormat;
		static void ReadFormat ();
		%feature("compactdefaultargs") ConvertFormatToUnicode;
		%feature("autodoc", "	* Converts the non-ASCII C string fromstr to the Unicode string of extended characters tostr. fromstr is translated according to the format --either ANSI, EUC, GB or SJIS-- returned by the function GetFormat.

	:param fromstr:
	:type fromstr: char *
	:param tostr:
	:type tostr: TCollection_ExtendedString &
	:rtype: void
") ConvertFormatToUnicode;
		static void ConvertFormatToUnicode (const char * fromstr,TCollection_ExtendedString & tostr);
		%feature("compactdefaultargs") ConvertUnicodeToFormat;
		%feature("autodoc", "	* Converts the Unicode string of extended characters fromstr to the non-ASCII C string tostr according to the format --either ANSI, EUC, GB or SJIS-- returned by the function GetFormat. maxsize limits the size of the string tostr to a maximum number of characters. You need more than twice the length of the string fromstr to complete the conversion. The function returns true if conversion is complete, i.e. the maximum number of characters maxsize is not reached by tostr before the end of conversion of fromstr.

	:param fromstr:
	:type fromstr: TCollection_ExtendedString &
	:param tostr:
	:type tostr: Standard_PCharacter &
	:param maxsize:
	:type maxsize: int
	:rtype: bool
") ConvertUnicodeToFormat;
		static Standard_Boolean ConvertUnicodeToFormat (const TCollection_ExtendedString & fromstr,Standard_PCharacter & tostr,const Standard_Integer maxsize);
};


%extend Resource_Unicode {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

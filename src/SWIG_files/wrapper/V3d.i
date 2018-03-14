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
%define V3DDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=V3DDOCSTRING) V3d

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


%include V3d_headers.i


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
typedef V3d_Viewer * V3d_ViewerPointer;
typedef V3d_ListOfLight::Iterator V3d_ListOfLightIterator;
typedef Standard_Real V3d_Parameter;
typedef V3d_ListOfView::Iterator V3d_ListOfViewIterator;
typedef V3d_View * V3d_ViewPointer;
typedef Standard_Real V3d_Coordinate;
/* end typedefs declaration */

/* templates */
%define Handle(Class) opencascade::handle<Class>
%enddef
%template(V3d_ListOfView) NCollection_List <Handle_V3d_View>;
%template(V3d_ListOfLight) NCollection_List <Handle_V3d_Light>;
/* end templates declaration */

/* public enums */
enum V3d_TypeOfPickCamera {
	V3d_POSITIONCAMERA = 0,
	V3d_SPACECAMERA = 1,
	V3d_RADIUSTEXTCAMERA = 2,
	V3d_ExtRADIUSCAMERA = 3,
	V3d_IntRADIUSCAMERA = 4,
	V3d_NOTHINGCAMERA = 5,
};

enum V3d_TypeOfVisualization {
	V3d_WIREFRAME = 0,
	V3d_ZBUFFER = 1,
};

enum V3d_TypeOfView {
	V3d_ORTHOGRAPHIC = 0,
	V3d_PERSPECTIVE = 1,
};

enum V3d_TypeOfLight {
	V3d_AMBIENT = 0,
	V3d_DIRECTIONAL = 1,
	V3d_POSITIONAL = 2,
	V3d_SPOT = 3,
};

enum V3d_StereoDumpOptions {
	V3d_SDO_MONO = 0,
	V3d_SDO_LEFT_EYE = 1,
	V3d_SDO_RIGHT_EYE = 2,
	V3d_SDO_BLENDED = 3,
};

enum V3d_TypeOfOrientation {
	V3d_Xpos = 0,
	V3d_Ypos = 1,
	V3d_Zpos = 2,
	V3d_Xneg = 3,
	V3d_Yneg = 4,
	V3d_Zneg = 5,
	V3d_XposYpos = 6,
	V3d_XposZpos = 7,
	V3d_YposZpos = 8,
	V3d_XnegYneg = 9,
	V3d_XnegYpos = 10,
	V3d_XnegZneg = 11,
	V3d_XnegZpos = 12,
	V3d_YnegZneg = 13,
	V3d_YnegZpos = 14,
	V3d_XposYneg = 15,
	V3d_XposZneg = 16,
	V3d_YposZneg = 17,
	V3d_XposYposZpos = 18,
	V3d_XposYnegZpos = 19,
	V3d_XposYposZneg = 20,
	V3d_XnegYposZpos = 21,
	V3d_XposYnegZneg = 22,
	V3d_XnegYposZneg = 23,
	V3d_XnegYnegZpos = 24,
	V3d_XnegYnegZneg = 25,
};

enum V3d_TypeOfAxe {
	V3d_X = 0,
	V3d_Y = 1,
	V3d_Z = 2,
};

enum V3d_TypeOfRepresentation {
	V3d_SIMPLE = 0,
	V3d_COMPLETE = 1,
	V3d_PARTIAL = 2,
	V3d_SAMELAST = 3,
};

enum V3d_TypeOfShadingModel {
	V3d_COLOR = 0,
	V3d_FLAT = 1,
	V3d_GOURAUD = 2,
	V3d_PHONG = 3,
};

enum V3d_TypeOfBackfacingModel {
	V3d_TOBM_AUTOMATIC = 0,
	V3d_TOBM_ALWAYS_DISPLAYED = 1,
	V3d_TOBM_NEVER_DISPLAYED = 2,
};

enum V3d_TypeOfPickLight {
	V3d_POSITIONLIGHT = 0,
	V3d_SPACELIGHT = 1,
	V3d_RADIUSTEXTLIGHT = 2,
	V3d_ExtRADIUSLIGHT = 3,
	V3d_IntRADIUSLIGHT = 4,
	V3d_NOTHING = 5,
};

/* end public enums declaration */

%rename(v3d) V3d;
class V3d {
	public:
		%feature("compactdefaultargs") GetProjAxis;
		%feature("autodoc", "	* Determines the orientation vector corresponding to the predefined orientation type.

	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: Graphic3d_Vector
") GetProjAxis;
		static Graphic3d_Vector GetProjAxis (const V3d_TypeOfOrientation Orientation);
		%feature("compactdefaultargs") ArrowOfRadius;
		%feature("autodoc", "	* Compute the graphic structure of arrow. X0,Y0,Z0 : coordinate of the arrow. DX,DY,DZ : Direction of the arrow. Alpha : Angle of arrow. Lng : Length of arrow.

	:param garrow:
	:type garrow: Handle_Graphic3d_Group &
	:param X0:
	:type X0: float
	:param Y0:
	:type Y0: float
	:param Z0:
	:type Z0: float
	:param DX:
	:type DX: float
	:param DY:
	:type DY: float
	:param DZ:
	:type DZ: float
	:param Alpha:
	:type Alpha: float
	:param Lng:
	:type Lng: float
	:rtype: void
") ArrowOfRadius;
		static void ArrowOfRadius (const Handle_Graphic3d_Group & garrow,const Standard_Real X0,const Standard_Real Y0,const Standard_Real Z0,const Standard_Real DX,const Standard_Real DY,const Standard_Real DZ,const Standard_Real Alpha,const Standard_Real Lng);
		%feature("compactdefaultargs") CircleInPlane;
		%feature("autodoc", "	* Compute the graphic structure of circle. X0,Y0,Z0 : Center of circle. VX,VY,VZ : Axis of circle. Radius : Radius of circle.

	:param gcircle:
	:type gcircle: Handle_Graphic3d_Group &
	:param X0:
	:type X0: float
	:param Y0:
	:type Y0: float
	:param Z0:
	:type Z0: float
	:param VX:
	:type VX: float
	:param VY:
	:type VY: float
	:param VZ:
	:type VZ: float
	:param Radius:
	:type Radius: float
	:rtype: void
") CircleInPlane;
		static void CircleInPlane (const Handle_Graphic3d_Group & gcircle,const Standard_Real X0,const Standard_Real Y0,const Standard_Real Z0,const Standard_Real VX,const Standard_Real VY,const Standard_Real VZ,const Standard_Real Radius);
		%feature("compactdefaultargs") SwitchViewsinWindow;
		%feature("autodoc", "	:param aPreviousView:
	:type aPreviousView: Handle_V3d_View &
	:param aNextView:
	:type aNextView: Handle_V3d_View &
	:rtype: void
") SwitchViewsinWindow;
		static void SwitchViewsinWindow (const Handle_V3d_View & aPreviousView,const Handle_V3d_View & aNextView);
};


%extend V3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_CircularGrid;
class V3d_CircularGrid : public Aspect_CircularGrid {
	public:
		%feature("compactdefaultargs") V3d_CircularGrid;
		%feature("autodoc", "	:param aViewer:
	:type aViewer: V3d_ViewerPointer &
	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") V3d_CircularGrid;
		 V3d_CircularGrid (const V3d_ViewerPointer & aViewer,const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") SetColors;
		void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	:rtype: None
") Display;
		void Display ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", "	:param Radius:
	:type Radius: float &
	:param OffSet:
	:type OffSet: float &
	:rtype: None
") GraphicValues;
		void GraphicValues (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", "	:param Radius:
	:type Radius: float
	:param OffSet:
	:type OffSet: float
	:rtype: None
") SetGraphicValues;
		void SetGraphicValues (const Standard_Real Radius,const Standard_Real OffSet);
};


%extend V3d_CircularGrid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_CircularGrid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_CircularGrid::Handle_V3d_CircularGrid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_CircularGrid;
class Handle_V3d_CircularGrid : public Handle_Aspect_CircularGrid {

    public:
        // constructors
        Handle_V3d_CircularGrid();
        Handle_V3d_CircularGrid(const Handle_V3d_CircularGrid &aHandle);
        Handle_V3d_CircularGrid(const V3d_CircularGrid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_CircularGrid DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_CircularGrid {
    V3d_CircularGrid* _get_reference() {
    return (V3d_CircularGrid*)$self->get();
    }
};

%extend Handle_V3d_CircularGrid {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_CircularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_ImageDumpOptions;
class V3d_ImageDumpOptions {
	public:
		int Width;
		int Height;
		Graphic3d_BufferType BufferType;
		V3d_StereoDumpOptions StereoOptions;
		int TileSize;
		bool ToAdjustAspect;
		%feature("compactdefaultargs") V3d_ImageDumpOptions;
		%feature("autodoc", "	* //!< flag to override active view aspect ratio by --Width / Height-- defined for image dump --True by default-- Default constructor.

	:rtype: None
") V3d_ImageDumpOptions;
		 V3d_ImageDumpOptions ();
};


%extend V3d_ImageDumpOptions {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_Light;
class V3d_Light : public Standard_Transient {
	public:
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Defines the color of a light source by giving the basic color.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetColor;
		void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Returns the color of the light source.

	:rtype: Quantity_Color
") Color;
		Quantity_Color Color ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the Type of the Light

	:rtype: V3d_TypeOfLight
") Type;
		V3d_TypeOfLight Type ();
		%feature("compactdefaultargs") Headlight;
		%feature("autodoc", "	* returns true if the light is a headlight

	:rtype: bool
") Headlight;
		Standard_Boolean Headlight ();
		%feature("compactdefaultargs") SetHeadlight;
		%feature("autodoc", "	* Setup headlight flag.

	:param theValue:
	:type theValue: bool
	:rtype: None
") SetHeadlight;
		void SetHeadlight (const Standard_Boolean theValue);
		%feature("compactdefaultargs") SetIntensity;
		%feature("autodoc", "	* Modifies the intensity of light source.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetIntensity;
		void SetIntensity (const Standard_Real theValue);
		%feature("compactdefaultargs") Intensity;
		%feature("autodoc", "	* returns the intensity of light source

	:rtype: float
") Intensity;
		Standard_Real Intensity ();
		%feature("compactdefaultargs") Smoothness;
		%feature("autodoc", "	* returns the smoothness of light source

	:rtype: float
") Smoothness;
		Standard_Real Smoothness ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns True when a light representation is displayed

	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
};


%extend V3d_Light {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_Light(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_Light::Handle_V3d_Light %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_Light;
class Handle_V3d_Light : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_V3d_Light();
        Handle_V3d_Light(const Handle_V3d_Light &aHandle);
        Handle_V3d_Light(const V3d_Light *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_Light DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_Light {
    V3d_Light* _get_reference() {
    return (V3d_Light*)$self->get();
    }
};

%extend Handle_V3d_Light {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_Light {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_Plane;
class V3d_Plane : public Standard_Transient {
	public:
		%feature("compactdefaultargs") V3d_Plane;
		%feature("autodoc", "	* Creates a clipping plane from plane coefficients.

	:param theA: default value is 0.0
	:type theA: float
	:param theB: default value is 0.0
	:type theB: float
	:param theC: default value is 1.0
	:type theC: float
	:param theD: default value is 0.0
	:type theD: float
	:rtype: None
") V3d_Plane;
		 V3d_Plane (const Standard_Real theA = 0.0,const Standard_Real theB = 0.0,const Standard_Real theC = 1.0,const Standard_Real theD = 0.0);
		%feature("compactdefaultargs") SetPlane;
		%feature("autodoc", "	* Change plane equation.

	:param theA:
	:type theA: float
	:param theB:
	:type theB: float
	:param theC:
	:type theC: float
	:param theD:
	:type theD: float
	:rtype: None
") SetPlane;
		void SetPlane (const Standard_Real theA,const Standard_Real theB,const Standard_Real theC,const Standard_Real theD);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the plane representation in the choosen view.

	:param theView:
	:type theView: Handle_V3d_View &
	:param theColor: default value is Quantity_NOC_GRAY
	:type theColor: Quantity_Color &
	:rtype: void
") Display;
		virtual void Display (const Handle_V3d_View & theView,const Quantity_Color & theColor = Quantity_NOC_GRAY);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erase the plane representation.

	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") Plane;
		%feature("autodoc", "	* Returns the parameters of the plane.

	:param theA:
	:type theA: float &
	:param theB:
	:type theB: float &
	:param theC:
	:type theC: float &
	:param theD:
	:type theD: float &
	:rtype: None
") Plane;
		void Plane (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	* Returns True when the plane representation is displayed.

	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") ClipPlane;
		%feature("autodoc", "	* Use this method to pass clipping plane implementation for standard clipping workflow. returns clipping plane implementation handle.

	:rtype: Handle_Graphic3d_ClipPlane
") ClipPlane;
		Handle_Graphic3d_ClipPlane ClipPlane ();
};


%extend V3d_Plane {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_Plane(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_Plane::Handle_V3d_Plane %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_Plane;
class Handle_V3d_Plane : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_V3d_Plane();
        Handle_V3d_Plane(const Handle_V3d_Plane &aHandle);
        Handle_V3d_Plane(const V3d_Plane *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_Plane DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_Plane {
    V3d_Plane* _get_reference() {
    return (V3d_Plane*)$self->get();
    }
};

%extend Handle_V3d_Plane {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_Plane {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_RectangularGrid;
class V3d_RectangularGrid : public Aspect_RectangularGrid {
	public:
		%feature("compactdefaultargs") V3d_RectangularGrid;
		%feature("autodoc", "	:param aViewer:
	:type aViewer: V3d_ViewerPointer &
	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: None
") V3d_RectangularGrid;
		 V3d_RectangularGrid (const V3d_ViewerPointer & aViewer,const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	:param aColor:
	:type aColor: Quantity_Color &
	:param aTenthColor:
	:type aTenthColor: Quantity_Color &
	:rtype: void
") SetColors;
		virtual void SetColors (const Quantity_Color & aColor,const Quantity_Color & aTenthColor);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	:rtype: void
") Display;
		virtual void Display ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	:rtype: void
") Erase;
		virtual void Erase ();
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:rtype: bool
") IsDisplayed;
		virtual Standard_Boolean IsDisplayed ();
		%feature("compactdefaultargs") GraphicValues;
		%feature("autodoc", "	:param XSize:
	:type XSize: float &
	:param YSize:
	:type YSize: float &
	:param OffSet:
	:type OffSet: float &
	:rtype: None
") GraphicValues;
		void GraphicValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetGraphicValues;
		%feature("autodoc", "	:param XSize:
	:type XSize: float
	:param YSize:
	:type YSize: float
	:param OffSet:
	:type OffSet: float
	:rtype: None
") SetGraphicValues;
		void SetGraphicValues (const Standard_Real XSize,const Standard_Real YSize,const Standard_Real OffSet);
};


%extend V3d_RectangularGrid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_RectangularGrid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_RectangularGrid::Handle_V3d_RectangularGrid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_RectangularGrid;
class Handle_V3d_RectangularGrid : public Handle_Aspect_RectangularGrid {

    public:
        // constructors
        Handle_V3d_RectangularGrid();
        Handle_V3d_RectangularGrid(const Handle_V3d_RectangularGrid &aHandle);
        Handle_V3d_RectangularGrid(const V3d_RectangularGrid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_RectangularGrid DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_RectangularGrid {
    V3d_RectangularGrid* _get_reference() {
    return (V3d_RectangularGrid*)$self->get();
    }
};

%extend Handle_V3d_RectangularGrid {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_RectangularGrid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_Trihedron;
class V3d_Trihedron : public Standard_Transient {
	public:
		%feature("compactdefaultargs") V3d_Trihedron;
		%feature("autodoc", "	* Creates a default trihedron.

	:rtype: None
") V3d_Trihedron;
		 V3d_Trihedron ();
		%feature("compactdefaultargs") SetWireframe;
		%feature("autodoc", "	* Switch wireframe / shaded trihedron.

	:param theAsWireframe:
	:type theAsWireframe: bool
	:rtype: None
") SetWireframe;
		void SetWireframe (const Standard_Boolean theAsWireframe);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Setup the corner to draw the trihedron.

	:param thePosition:
	:type thePosition: Aspect_TypeOfTriedronPosition
	:rtype: None
") SetPosition;
		void SetPosition (const Aspect_TypeOfTriedronPosition thePosition);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Setup the scale factor.

	:param theScale:
	:type theScale: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real theScale);
		%feature("compactdefaultargs") SetSizeRatio;
		%feature("autodoc", "	* Setup the size ratio factor.

	:param theRatio:
	:type theRatio: float
	:rtype: None
") SetSizeRatio;
		void SetSizeRatio (const Standard_Real theRatio);
		%feature("compactdefaultargs") SetArrowDiameter;
		%feature("autodoc", "	* Setup the arrow diameter.

	:param theDiam:
	:type theDiam: float
	:rtype: None
") SetArrowDiameter;
		void SetArrowDiameter (const Standard_Real theDiam);
		%feature("compactdefaultargs") SetNbFacets;
		%feature("autodoc", "	* Setup the number of facets for tessellation.

	:param theNbFacets:
	:type theNbFacets: int
	:rtype: None
") SetNbFacets;
		void SetNbFacets (const Standard_Integer theNbFacets);
		%feature("compactdefaultargs") SetLabelsColor;
		%feature("autodoc", "	* Setup color of text labels.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetLabelsColor;
		void SetLabelsColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetArrowsColor;
		%feature("autodoc", "	* Setup colors of arrows.

	:param theXColor:
	:type theXColor: Quantity_Color &
	:param theYColor:
	:type theYColor: Quantity_Color &
	:param theZColor:
	:type theZColor: Quantity_Color &
	:rtype: None
") SetArrowsColor;
		void SetArrowsColor (const Quantity_Color & theXColor,const Quantity_Color & theYColor,const Quantity_Color & theZColor);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display trihedron.

	:param theView:
	:type theView: V3d_View &
	:rtype: None
") Display;
		void Display (const V3d_View & theView);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erase trihedron.

	:rtype: None
") Erase;
		void Erase ();
};


%extend V3d_Trihedron {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_Trihedron(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_Trihedron::Handle_V3d_Trihedron %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_Trihedron;
class Handle_V3d_Trihedron : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_V3d_Trihedron();
        Handle_V3d_Trihedron(const Handle_V3d_Trihedron &aHandle);
        Handle_V3d_Trihedron(const V3d_Trihedron *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_Trihedron DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_Trihedron {
    V3d_Trihedron* _get_reference() {
    return (V3d_Trihedron*)$self->get();
    }
};

%extend Handle_V3d_Trihedron {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_Trihedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_View;
class V3d_View : public Standard_Transient {
	public:
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "	* Initializes the view.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theType: default value is V3d_ORTHOGRAPHIC
	:type theType: V3d_TypeOfView
	:rtype: None
") V3d_View;
		 V3d_View (const Handle_V3d_Viewer & theViewer,const V3d_TypeOfView theType = V3d_ORTHOGRAPHIC);
		%feature("compactdefaultargs") V3d_View;
		%feature("autodoc", "	* Initializes the view by copying.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") V3d_View;
		 V3d_View (const Handle_V3d_Viewer & theViewer,const Handle_V3d_View & theView);
		%feature("compactdefaultargs") SetWindow;
		%feature("autodoc", "	* Activates the view in the specified Window If <aContext> is not NULL the graphic context is used to draw something in this view. Otherwise an internal graphic context is created. Warning: The view is centered and resized to preserve the height/width ratio of the window.

	:param theWindow:
	:type theWindow: Handle_Aspect_Window &
	:param theContext: default value is NULL
	:type theContext: Aspect_RenderingContext
	:rtype: None
") SetWindow;
		void SetWindow (const Handle_Aspect_Window & theWindow,const Aspect_RenderingContext theContext = NULL);
		%feature("compactdefaultargs") SetMagnify;
		%feature("autodoc", "	:param theWindow:
	:type theWindow: Handle_Aspect_Window &
	:param thePreviousView:
	:type thePreviousView: Handle_V3d_View &
	:param theX1:
	:type theX1: int
	:param theY1:
	:type theY1: int
	:param theX2:
	:type theX2: int
	:param theY2:
	:type theY2: int
	:rtype: None
") SetMagnify;
		void SetMagnify (const Handle_Aspect_Window & theWindow,const Handle_V3d_View & thePreviousView,const Standard_Integer theX1,const Standard_Integer theY1,const Standard_Integer theX2,const Standard_Integer theY2);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Destroys the view.

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Deprecated, Redraw---- should be used instead.

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redisplays the view even if there has not been any modification. Must be called if the view is shown. --Ex: DeIconification -- .

	:rtype: void
") Redraw;
		virtual void Redraw ();
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Updates layer of immediate presentations.

	:rtype: void
") RedrawImmediate;
		virtual void RedrawImmediate ();
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "	* Invalidates view content but does not redraw it.

	:rtype: None
") Invalidate;
		void Invalidate ();
		%feature("compactdefaultargs") IsInvalidated;
		%feature("autodoc", "	* Returns true if cached view content has been invalidated.

	:rtype: bool
") IsInvalidated;
		Standard_Boolean IsInvalidated ();
		%feature("compactdefaultargs") MustBeResized;
		%feature("autodoc", "	* Must be called when the window supporting the view changes size. if the view is not mapped on a window. Warning: The view is centered and resized to preserve the height/width ratio of the window.

	:rtype: None
") MustBeResized;
		void MustBeResized ();
		%feature("compactdefaultargs") DoMapping;
		%feature("autodoc", "	* Must be called when the window supporting the view is mapped or unmapped.

	:rtype: None
") DoMapping;
		void DoMapping ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns the status of the view regarding the displayed structures inside Returns True is The View is empty

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "	* Updates the lights of the view. The view is redrawn.

	:rtype: None
") UpdateLights;
		void UpdateLights ();
		%feature("compactdefaultargs") SetAutoZFitMode;
		%feature("autodoc", "	* Sets the automatic z-fit mode and its parameters. The auto z-fit has extra parameters which can controlled from application level to ensure that the size of viewing volume will be sufficiently large to cover the depth of unmanaged objects, for example, transformation persistent ones. @param theScaleFactor [in] the scale factor for Z-range. The range between Z-min, Z-max projection volume planes evaluated by z fitting method will be scaled using this coefficient. Program error exception is thrown if negative or zero value is passed.

	:param theIsOn:
	:type theIsOn: bool
	:param theScaleFactor: default value is 1.0
	:type theScaleFactor: float
	:rtype: None
") SetAutoZFitMode;
		void SetAutoZFitMode (const Standard_Boolean theIsOn,const Standard_Real theScaleFactor = 1.0);
		%feature("compactdefaultargs") AutoZFitMode;
		%feature("autodoc", "	* returns True if automatic z-fit mode is turned on.

	:rtype: bool
") AutoZFitMode;
		Standard_Boolean AutoZFitMode ();
		%feature("compactdefaultargs") AutoZFitScaleFactor;
		%feature("autodoc", "	* returns scale factor parameter of automatic z-fit mode.

	:rtype: float
") AutoZFitScaleFactor;
		Standard_Real AutoZFitScaleFactor ();
		%feature("compactdefaultargs") AutoZFit;
		%feature("autodoc", "	* If automatic z-range fitting is turned on, adjusts Z-min and Z-max projection volume planes with call to ZFitAll.

	:rtype: None
") AutoZFit;
		void AutoZFit ();
		%feature("compactdefaultargs") ZFitAll;
		%feature("autodoc", "	* Change Z-min and Z-max planes of projection volume to match the displayed objects.

	:param theScaleFactor: default value is 1.0
	:type theScaleFactor: float
	:rtype: None
") ZFitAll;
		void ZFitAll (const Standard_Real theScaleFactor = 1.0);
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "	* Defines the background color of the view by the color definition type and the three corresponding values.

	:param theType:
	:type theType: Quantity_TypeOfColor
	:param theV1:
	:type theV1: float
	:param theV2:
	:type theV2: float
	:param theV3:
	:type theV3: float
	:rtype: None
") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_TypeOfColor theType,const Standard_Real theV1,const Standard_Real theV2,const Standard_Real theV3);
		%feature("compactdefaultargs") SetBackgroundColor;
		%feature("autodoc", "	* Defines the background color of the view.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetBackgroundColor;
		void SetBackgroundColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetBgGradientColors;
		%feature("autodoc", "	* Defines the gradient background colors of the view by supplying the colors and the fill method --horizontal by default--.

	:param theColor1:
	:type theColor1: Quantity_Color &
	:param theColor2:
	:type theColor2: Quantity_Color &
	:param theFillStyle: default value is Aspect_GFM_HOR
	:type theFillStyle: Aspect_GradientFillMethod
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None
") SetBgGradientColors;
		void SetBgGradientColors (const Quantity_Color & theColor1,const Quantity_Color & theColor2,const Aspect_GradientFillMethod theFillStyle = Aspect_GFM_HOR,const Standard_Boolean theToUpdate = Standard_False);
		%feature("compactdefaultargs") SetBgGradientStyle;
		%feature("autodoc", "	* Defines the gradient background fill method of the view.

	:param theMethod: default value is Aspect_GFM_HOR
	:type theMethod: Aspect_GradientFillMethod
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None
") SetBgGradientStyle;
		void SetBgGradientStyle (const Aspect_GradientFillMethod theMethod = Aspect_GFM_HOR,const Standard_Boolean theToUpdate = Standard_False);
		%feature("compactdefaultargs") SetBackgroundImage;
		%feature("autodoc", "	* Defines the background texture of the view by supplying the texture image file name and fill method --centered by default--.

	:param theFileName:
	:type theFileName: char *
	:param theFillStyle: default value is Aspect_FM_CENTERED
	:type theFillStyle: Aspect_FillMethod
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None
") SetBackgroundImage;
		void SetBackgroundImage (const char * theFileName,const Aspect_FillMethod theFillStyle = Aspect_FM_CENTERED,const Standard_Boolean theToUpdate = Standard_False);
		%feature("compactdefaultargs") SetBgImageStyle;
		%feature("autodoc", "	* Defines the textured background fill method of the view.

	:param theFillStyle:
	:type theFillStyle: Aspect_FillMethod
	:param theToUpdate: default value is Standard_False
	:type theToUpdate: bool
	:rtype: None
") SetBgImageStyle;
		void SetBgImageStyle (const Aspect_FillMethod theFillStyle,const Standard_Boolean theToUpdate = Standard_False);
		%feature("compactdefaultargs") SetAxis;
		%feature("autodoc", "	* Definition of an axis from its origin and its orientation . This will be the current axis for rotations and movements. Warning! raises BadValue from V3d if the vector normal is NULL. .

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None
") SetAxis;
		void SetAxis (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Real Vx,const Standard_Real Vy,const Standard_Real Vz);
		%feature("compactdefaultargs") SetShadingModel;
		%feature("autodoc", "	* Defines the shading model for the visualization. Various models are available.

	:param theShadingModel:
	:type theShadingModel: V3d_TypeOfShadingModel
	:rtype: None
") SetShadingModel;
		void SetShadingModel (const V3d_TypeOfShadingModel theShadingModel);
		%feature("compactdefaultargs") SetTextureEnv;
		%feature("autodoc", "	* Sets the environment texture to use. No environment texture by default.

	:param theTexture:
	:type theTexture: Handle_Graphic3d_TextureEnv &
	:rtype: None
") SetTextureEnv;
		void SetTextureEnv (const Handle_Graphic3d_TextureEnv & theTexture);
		%feature("compactdefaultargs") SetVisualization;
		%feature("autodoc", "	* Defines the visualization type in the view.

	:param theType:
	:type theType: V3d_TypeOfVisualization
	:rtype: None
") SetVisualization;
		void SetVisualization (const V3d_TypeOfVisualization theType);
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates theLight in the view.

	:param theLight:
	:type theLight: Handle_V3d_Light &
	:rtype: None
") SetLightOn;
		void SetLightOn (const Handle_V3d_Light & theLight);
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates all the lights defined in this view.

	:rtype: None
") SetLightOn;
		void SetLightOn ();
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Deactivate theLight in this view.

	:param theLight:
	:type theLight: Handle_V3d_Light &
	:rtype: None
") SetLightOff;
		void SetLightOff (const Handle_V3d_Light & theLight);
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Deactivate all the Lights defined in this view.

	:rtype: None
") SetLightOff;
		void SetLightOff ();
		%feature("compactdefaultargs") IsActiveLight;
		%feature("autodoc", "	* Returns True when the light is active in this view.

	:param theLight:
	:type theLight: Handle_V3d_Light &
	:rtype: bool
") IsActiveLight;
		Standard_Boolean IsActiveLight (const Handle_V3d_Light & theLight);
		%feature("compactdefaultargs") SetImmediateUpdate;
		%feature("autodoc", "	* sets the immediate update mode and returns the previous one.

	:param theImmediateUpdate:
	:type theImmediateUpdate: bool
	:rtype: bool
") SetImmediateUpdate;
		Standard_Boolean SetImmediateUpdate (const Standard_Boolean theImmediateUpdate);
		%feature("compactdefaultargs") ZBufferTriedronSetup;
		%feature("autodoc", "	* Customization of the ZBUFFER Triedron. XColor,YColor,ZColor - colors of axis SizeRatio - ratio of decreasing of the trihedron size when its physical position comes out of the view AxisDiametr - diameter relatively to axis length NbFacettes - number of facets of cylinders and cones

	:param theXColor: default value is Quantity_NOC_RED
	:type theXColor: Quantity_Color &
	:param theYColor: default value is Quantity_NOC_GREEN
	:type theYColor: Quantity_Color &
	:param theZColor: default value is Quantity_NOC_BLUE1
	:type theZColor: Quantity_Color &
	:param theSizeRatio: default value is 0.8
	:type theSizeRatio: float
	:param theAxisDiametr: default value is 0.05
	:type theAxisDiametr: float
	:param theNbFacettes: default value is 12
	:type theNbFacettes: int
	:rtype: None
") ZBufferTriedronSetup;
		void ZBufferTriedronSetup (const Quantity_Color & theXColor = Quantity_NOC_RED,const Quantity_Color & theYColor = Quantity_NOC_GREEN,const Quantity_Color & theZColor = Quantity_NOC_BLUE1,const Standard_Real theSizeRatio = 0.8,const Standard_Real theAxisDiametr = 0.05,const Standard_Integer theNbFacettes = 12);
		%feature("compactdefaultargs") TriedronDisplay;
		%feature("autodoc", "	* Display of the Triedron. Initialize position, color and length of Triedron axes. The scale is a percent of the window width.

	:param thePosition: default value is Aspect_TOTP_CENTER
	:type thePosition: Aspect_TypeOfTriedronPosition
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color &
	:param theScale: default value is 0.02
	:type theScale: float
	:param theMode: default value is V3d_WIREFRAME
	:type theMode: V3d_TypeOfVisualization
	:rtype: None
") TriedronDisplay;
		void TriedronDisplay (const Aspect_TypeOfTriedronPosition thePosition = Aspect_TOTP_CENTER,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theScale = 0.02,const V3d_TypeOfVisualization theMode = V3d_WIREFRAME);
		%feature("compactdefaultargs") TriedronErase;
		%feature("autodoc", "	* Erases the Triedron.

	:rtype: None
") TriedronErase;
		void TriedronErase ();
		%feature("compactdefaultargs") GetGraduatedTrihedron;
		%feature("autodoc", "	* Returns data of a graduated trihedron.

	:rtype: Graphic3d_GraduatedTrihedron
") GetGraduatedTrihedron;
		const Graphic3d_GraduatedTrihedron & GetGraduatedTrihedron ();
		%feature("compactdefaultargs") GraduatedTrihedronDisplay;
		%feature("autodoc", "	* Displays a graduated trihedron.

	:param theTrihedronData:
	:type theTrihedronData: Graphic3d_GraduatedTrihedron &
	:rtype: None
") GraduatedTrihedronDisplay;
		void GraduatedTrihedronDisplay (const Graphic3d_GraduatedTrihedron & theTrihedronData);
		%feature("compactdefaultargs") GraduatedTrihedronErase;
		%feature("autodoc", "	* Erases a graduated trihedron from the view.

	:rtype: None
") GraduatedTrihedronErase;
		void GraduatedTrihedronErase ();
		%feature("compactdefaultargs") SetFront;
		%feature("autodoc", "	* modify the Projection of the view perpendicularly to the privileged plane of the viewer.

	:rtype: None
") SetFront;
		void SetFront ();
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye about the coordinate system of reference of the screen for which the origin is the view point of the projection, with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True Warning! raises BadValue from V3d If the eye, the view point, or the high point are aligned or confused.

	:param Ax:
	:type Ax: float
	:param Ay:
	:type Ay: float
	:param Az:
	:type Az: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const Standard_Real Ax,const Standard_Real Ay,const Standard_Real Az,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye about the coordinate system of reference of the screen for which the origin is Gravity point {X,Y,Z}, with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True If the eye, the view point, or the high point are aligned or confused.

	:param Ax:
	:type Ax: float
	:param Ay:
	:type Ay: float
	:param Az:
	:type Az: float
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const Standard_Real Ax,const Standard_Real Ay,const Standard_Real Az,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye about one of the coordinate axes of of the view for which the origin is the Gravity point{X,Y,Z} with an relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: float
	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const V3d_TypeOfAxe Axe,const Standard_Real Angle,const Standard_Real X,const Standard_Real Y,const Standard_Real Z,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye about one of the coordinate axes of of the view for which the origin is the view point of the projection with an relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const V3d_TypeOfAxe Axe,const Standard_Real Angle,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Rotate;
		%feature("autodoc", "	* Rotates the eye around the current axis a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True

	:param Angle:
	:type Angle: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Rotate;
		void Rotate (const Standard_Real Angle,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Movement of the eye parallel to the coordinate system of reference of the screen a distance relative to the initial position expressed by Start = Standard_True.

	:param Dx:
	:type Dx: float
	:param Dy:
	:type Dy: float
	:param Dz:
	:type Dz: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Move;
		void Move (const Standard_Real Dx,const Standard_Real Dy,const Standard_Real Dz,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Movement of the eye parallel to one of the axes of the coordinate system of reference of the view a distance relative to the initial position expressed by Start = Standard_True.

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Length:
	:type Length: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Move;
		void Move (const V3d_TypeOfAxe Axe,const Standard_Real Length,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Move;
		%feature("autodoc", "	* Movement of the eye parllel to the current axis a distance relative to the initial position expressed by Start = Standard_True

	:param Length:
	:type Length: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Move;
		void Move (const Standard_Real Length,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Movement of the ye and the view point parallel to the frame of reference of the screen a distance relative to the initial position expressed by Start = Standard_True

	:param Dx:
	:type Dx: float
	:param Dy:
	:type Dy: float
	:param Dz:
	:type Dz: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Translate;
		void Translate (const Standard_Real Dx,const Standard_Real Dy,const Standard_Real Dz,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Movement of the eye and the view point parallel to one of the axes of the fame of reference of the view a distance relative to the initial position expressed by Start = Standard_True

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Length:
	:type Length: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Translate;
		void Translate (const V3d_TypeOfAxe Axe,const Standard_Real Length,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Translate;
		%feature("autodoc", "	* Movement of the eye and view point parallel to the current axis a distance relative to the initial position expressed by Start = Standard_True

	:param Length:
	:type Length: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Translate;
		void Translate (const Standard_Real Length,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Place;
		%feature("autodoc", "	* places the point of the view corresponding at the pixel position x,y at the center of the window and updates the view.

	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:param theZoomFactor: default value is 1
	:type theZoomFactor: float
	:rtype: None
") Place;
		void Place (const Standard_Integer theXp,const Standard_Integer theYp,const Standard_Real theZoomFactor = 1);
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "	* Rotation of the view point around the frame of reference of the screen for which the origin is the eye of the projection with a relative angular value in RADIANS with respect to the initial position expressed by Start = Standard_True

	:param Ax:
	:type Ax: float
	:param Ay:
	:type Ay: float
	:param Az:
	:type Az: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Turn;
		void Turn (const Standard_Real Ax,const Standard_Real Ay,const Standard_Real Az,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "	* Rotation of the view point around one of the axes of the frame of reference of the view for which the origin is the eye of the projection with an angular value in RADIANS relative to the initial position expressed by Start = Standard_True

	:param Axe:
	:type Axe: V3d_TypeOfAxe
	:param Angle:
	:type Angle: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Turn;
		void Turn (const V3d_TypeOfAxe Axe,const Standard_Real Angle,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") Turn;
		%feature("autodoc", "	* Rotation of the view point around the current axis an angular value in RADIANS relative to the initial position expressed by Start = Standard_True

	:param Angle:
	:type Angle: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") Turn;
		void Turn (const Standard_Real Angle,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") SetTwist;
		%feature("autodoc", "	* Defines the angular position of the high point of the reference frame of the view with respect to the Y screen axis with an absolute angular value in RADIANS.

	:param Angle:
	:type Angle: float
	:rtype: None
") SetTwist;
		void SetTwist (const Standard_Real Angle);
		%feature("compactdefaultargs") SetEye;
		%feature("autodoc", "	* Defines the position of the eye..

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None
") SetEye;
		void SetEye (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") SetDepth;
		%feature("autodoc", "	* Defines the Depth of the eye from the view point without update the projection .

	:param Depth:
	:type Depth: float
	:rtype: None
") SetDepth;
		void SetDepth (const Standard_Real Depth);
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "	* Defines the orientation of the projection.

	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None
") SetProj;
		void SetProj (const Standard_Real Vx,const Standard_Real Vy,const Standard_Real Vz);
		%feature("compactdefaultargs") SetProj;
		%feature("autodoc", "	* Defines the orientation of the projection .

	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: None
") SetProj;
		void SetProj (const V3d_TypeOfOrientation Orientation);
		%feature("compactdefaultargs") SetAt;
		%feature("autodoc", "	* Defines the position of the view point.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:rtype: None
") SetAt;
		void SetAt (const Standard_Real X,const Standard_Real Y,const Standard_Real Z);
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "	* Defines the orientation of the high point.

	:param Vx:
	:type Vx: float
	:param Vy:
	:type Vy: float
	:param Vz:
	:type Vz: float
	:rtype: None
") SetUp;
		void SetUp (const Standard_Real Vx,const Standard_Real Vy,const Standard_Real Vz);
		%feature("compactdefaultargs") SetUp;
		%feature("autodoc", "	* Defines the orientation--SO-- of the high point.

	:param Orientation:
	:type Orientation: V3d_TypeOfOrientation
	:rtype: None
") SetUp;
		void SetUp (const V3d_TypeOfOrientation Orientation);
		%feature("compactdefaultargs") SetViewOrientationDefault;
		%feature("autodoc", "	* Saves the current state of the orientation of the view which will be the return state at ResetViewOrientation.

	:rtype: None
") SetViewOrientationDefault;
		void SetViewOrientationDefault ();
		%feature("compactdefaultargs") ResetViewOrientation;
		%feature("autodoc", "	* Resets the orientation of the view. Updates the view

	:rtype: None
") ResetViewOrientation;
		void ResetViewOrientation ();
		%feature("compactdefaultargs") Panning;
		%feature("autodoc", "	* Translates the center of the view along 'x' and 'y' axes of view projection. Can be used to perform interactive panning operation. In that case the DXv, DXy parameters specify panning relative to the point where the operation is started. @param theDXv [in] the relative panning on 'x' axis of view projection, in view space coordinates. @param theDYv [in] the relative panning on 'y' axis of view projection, in view space coordinates. @param theZoomFactor [in] the zooming factor. @param theToStart [in] pass True when starting panning to remember view state prior to panning for relative arguments. If panning is started, passing {0, 0} for {theDXv, theDYv} will return view to initial state. Performs update of view.

	:param theDXv:
	:type theDXv: float
	:param theDYv:
	:type theDYv: float
	:param theZoomFactor: default value is 1
	:type theZoomFactor: float
	:param theToStart: default value is Standard_True
	:type theToStart: bool
	:rtype: None
") Panning;
		void Panning (const Standard_Real theDXv,const Standard_Real theDYv,const Standard_Real theZoomFactor = 1,const Standard_Boolean theToStart = Standard_True);
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "	* Relocates center of screen to the point, determined by {Xp, Yp} pixel coordinates relative to the bottom-left corner of screen. To calculate pixel coordinates for any point from world coordinate space, it can be projected using 'Project'. @param theXp [in] the x coordinate. @param theYp [in] the y coordinate.

	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:rtype: None
") SetCenter;
		void SetCenter (const Standard_Integer theXp,const Standard_Integer theYp);
		%feature("compactdefaultargs") SetSize;
		%feature("autodoc", "	* Defines the view projection size in its maximum dimension, keeping the inital height/width ratio unchanged.

	:param theSize:
	:type theSize: float
	:rtype: None
") SetSize;
		void SetSize (const Standard_Real theSize);
		%feature("compactdefaultargs") SetZSize;
		%feature("autodoc", "	* Defines the Depth size of the view Front Plane will be set to Size/2. Back Plane will be set to -Size/2. Any Object located Above the Front Plane or behind the Back Plane will be Clipped . NOTE than the XY Size of the View is NOT modified .

	:param SetZSize:
	:type SetZSize: float
	:rtype: None
") SetZSize;
		void SetZSize (const Standard_Real SetZSize);
		%feature("compactdefaultargs") SetZoom;
		%feature("autodoc", "	* Zooms the view by a factor relative to the initial value expressed by Start = Standard_True Updates the view.

	:param Coef:
	:type Coef: float
	:param Start: default value is Standard_True
	:type Start: bool
	:rtype: None
") SetZoom;
		void SetZoom (const Standard_Real Coef,const Standard_Boolean Start = Standard_True);
		%feature("compactdefaultargs") SetScale;
		%feature("autodoc", "	* Zooms the view by a factor relative to the value initialised by SetViewMappingDefault----. Updates the view.

	:param Coef:
	:type Coef: float
	:rtype: None
") SetScale;
		void SetScale (const Standard_Real Coef);
		%feature("compactdefaultargs") SetAxialScale;
		%feature("autodoc", "	* Sets anisotropic --axial-- scale factors <Sx>, <Sy>, <Sz> for view <self>. Anisotropic scaling operation is performed through multiplying the current view orientation matrix by a scaling matrix: || Sx 0 0 0 || || 0 Sy 0 0 || || 0 0 Sz 0 || || 0 0 0 1 || Updates the view.

	:param Sx:
	:type Sx: float
	:param Sy:
	:type Sy: float
	:param Sz:
	:type Sz: float
	:rtype: None
") SetAxialScale;
		void SetAxialScale (const Standard_Real Sx,const Standard_Real Sy,const Standard_Real Sz);
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "	* Adjust view parameters to fit the displayed scene, respecting height / width ratio. The Z clipping range --depth range-- is fitted if AutoZFit flag is True. Throws program error exception if margin coefficient is < 0 or >= 1. Updates the view. @param theMargin [in] the margin coefficient for view borders. @param theToUpdate [in] flag to perform view update.

	:param theMargin: default value is 0.01
	:type theMargin: float
	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None
") FitAll;
		void FitAll (const Standard_Real theMargin = 0.01,const Standard_Boolean theToUpdate = Standard_True);
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "	* Adjust view parameters to fit the displayed scene, respecting height / width ratio according to the custom bounding box given. Throws program error exception if margin coefficient is < 0 or >= 1. Updates the view. @param theBox [in] the custom bounding box to fit. @param theMargin [in] the margin coefficient for view borders. @param theToUpdate [in] flag to perform view update.

	:param theBox:
	:type theBox: Bnd_Box &
	:param theMargin: default value is 0.01
	:type theMargin: float
	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None
") FitAll;
		void FitAll (const Bnd_Box & theBox,const Standard_Real theMargin = 0.01,const Standard_Boolean theToUpdate = Standard_True);
		%feature("compactdefaultargs") DepthFitAll;
		%feature("autodoc", "	* Adjusts the viewing volume so as not to clip the displayed objects by front and back and back clipping planes. Also sets depth value automatically depending on the calculated Z size and Aspect parameter. NOTE than the original XY size of the view is NOT modified .

	:param Aspect: default value is 0.01
	:type Aspect: float
	:param Margin: default value is 0.01
	:type Margin: float
	:rtype: None
") DepthFitAll;
		void DepthFitAll (const Standard_Real Aspect = 0.01,const Standard_Real Margin = 0.01);
		%feature("compactdefaultargs") FitAll;
		%feature("autodoc", "	* Centers the defined projection window so that it occupies the maximum space while respecting the initial height/width ratio. NOTE than the original Z size of the view is NOT modified .

	:param theMinXv:
	:type theMinXv: float
	:param theMinYv:
	:type theMinYv: float
	:param theMaxXv:
	:type theMaxXv: float
	:param theMaxYv:
	:type theMaxYv: float
	:rtype: None
") FitAll;
		void FitAll (const Standard_Real theMinXv,const Standard_Real theMinYv,const Standard_Real theMaxXv,const Standard_Real theMaxYv);
		%feature("compactdefaultargs") WindowFit;
		%feature("autodoc", "	* Centers the defined PIXEL window so that it occupies the maximum space while respecting the initial height/width ratio. NOTE than the original Z size of the view is NOT modified. @param theMinXp [in] pixel coordinates of minimal corner on x screen axis. @param theMinYp [in] pixel coordinates of minimal corner on y screen axis. @param theMaxXp [in] pixel coordinates of maximal corner on x screen axis. @param theMaxYp [in] pixel coordinates of maximal corner on y screen axis.

	:param theMinXp:
	:type theMinXp: int
	:param theMinYp:
	:type theMinYp: int
	:param theMaxXp:
	:type theMaxXp: int
	:param theMaxYp:
	:type theMaxYp: int
	:rtype: None
") WindowFit;
		void WindowFit (const Standard_Integer theMinXp,const Standard_Integer theMinYp,const Standard_Integer theMaxXp,const Standard_Integer theMaxYp);
		%feature("compactdefaultargs") SetViewMappingDefault;
		%feature("autodoc", "	* Saves the current view mapping. This will be the state returned from ResetViewmapping.

	:rtype: None
") SetViewMappingDefault;
		void SetViewMappingDefault ();
		%feature("compactdefaultargs") ResetViewMapping;
		%feature("autodoc", "	* Resets the centering of the view. Updates the view

	:rtype: None
") ResetViewMapping;
		void ResetViewMapping ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Resets the centering and the orientation of the view.

	:param theToUpdate: default value is Standard_True
	:type theToUpdate: bool
	:rtype: None
") Reset;
		void Reset (const Standard_Boolean theToUpdate = Standard_True);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts the PIXEL value to a value in the projection plane.

	:param Vp:
	:type Vp: int
	:rtype: float
") Convert;
		Standard_Real Convert (const Standard_Integer Vp);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts the point PIXEL into a point projected in the reference frame of the projection plane.

	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param Xv:
	:type Xv: float &
	:param Yv:
	:type Yv: float &
	:rtype: None
") Convert;
		void Convert (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts tha value of the projection plane into a PIXEL value.

	:param Vv:
	:type Vv: float
	:rtype: int
") Convert;
		Standard_Integer Convert (const Standard_Real Vv);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts the point defined in the reference frame of the projection plane into a point PIXEL.

	:param Xv:
	:type Xv: float
	:param Yv:
	:type Yv: float
	:param Xp:
	:type Xp: int &
	:param Yp:
	:type Yp: int &
	:rtype: None
") Convert;
		void Convert (const Standard_Real Xv,const Standard_Real Yv,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector.

	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Convert;
		void Convert (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConvertWithProj;
		%feature("autodoc", "	* Converts the projected point into a point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and returns the projection ray for further computations.

	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:param Vx:
	:type Vx: float &
	:param Vy:
	:type Vy: float &
	:param Vz:
	:type Vz: float &
	:rtype: None
") ConvertWithProj;
		void ConvertWithProj (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "	* Converts the projected point into the nearest grid point in the reference frame of the view corresponding to the intersection with the projection plane of the eye/view point vector and display the grid marker. Warning: When the grid is not active the result is identical to the above Convert---- method. How to use: 1-- Enable the grid echo display myViewer->SetGridEcho--Standard_True--; 2-- When application receive a move event: 2.1-- Check if any object is detected if-- myInteractiveContext->MoveTo--x,y-- == AIS_SOD_Nothing -- { 2.2-- Check if the grid is active if-- myViewer->Grid----->IsActive---- -- { 2.3-- Display the grid echo and gets the grid point myView->ConvertToGrid--x,y,X,Y,Z--; myView->Viewer----->ShowGridEcho --myView, Graphic3d_Vertex --X,Y,Z----; myView->RedrawImmediate----; 2.4-- Else this is the standard case } else myView->Convert--x,y,X,Y,Z--;

	:param Xp:
	:type Xp: int
	:param Yp:
	:type Yp: int
	:param Xg:
	:type Xg: float &
	:param Yg:
	:type Yg: float &
	:param Zg:
	:type Zg: float &
	:rtype: None
") ConvertToGrid;
		void ConvertToGrid (const Standard_Integer Xp,const Standard_Integer Yp,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ConvertToGrid;
		%feature("autodoc", "	* Converts the point into the nearest grid point and display the grid marker.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Xg:
	:type Xg: float &
	:param Yg:
	:type Yg: float &
	:param Zg:
	:type Zg: float &
	:rtype: None
") ConvertToGrid;
		void ConvertToGrid (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Projects the point defined in the reference frame of the view into the projected point in the associated window.

	:param X:
	:type X: float
	:param Y:
	:type Y: float
	:param Z:
	:type Z: float
	:param Xp:
	:type Xp: int &
	:param Yp:
	:type Yp: int &
	:rtype: None
") Convert;
		void Convert (const Standard_Real X,const Standard_Real Y,const Standard_Real Z,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Converts the point defined in the user space of the view to the projection plane at the depth relative to theZ.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theXp:
	:type theXp: float &
	:param theYp:
	:type theYp: float &
	:rtype: None
") Project;
		void Project (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Converts the point defined in the user space of the view to the projection plane at the depth relative to theZ.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theXp:
	:type theXp: float &
	:param theYp:
	:type theYp: float &
	:param theZp:
	:type theZp: float &
	:rtype: None
") Project;
		void Project (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "	* Returns the Background color values of the view depending of the color Type.

	:param Type:
	:type Type: Quantity_TypeOfColor
	:param V1:
	:type V1: float &
	:param V2:
	:type V2: float &
	:param V3:
	:type V3: float &
	:rtype: None
") BackgroundColor;
		void BackgroundColor (const Quantity_TypeOfColor Type,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") BackgroundColor;
		%feature("autodoc", "	* Returns the Background color object of the view.

	:rtype: Quantity_Color
") BackgroundColor;
		Quantity_Color BackgroundColor ();
		%feature("compactdefaultargs") GradientBackgroundColors;
		%feature("autodoc", "	* Returns the gradient background colors of the view.

	:param theColor1:
	:type theColor1: Quantity_Color &
	:param theColor2:
	:type theColor2: Quantity_Color &
	:rtype: None
") GradientBackgroundColors;
		void GradientBackgroundColors (Quantity_Color & theColor1,Quantity_Color & theColor2);
		%feature("compactdefaultargs") GradientBackground;
		%feature("autodoc", "	* Returns the gradient background of the view.

	:rtype: Aspect_GradientBackground
") GradientBackground;
		Aspect_GradientBackground GradientBackground ();
		%feature("compactdefaultargs") Scale;
		%feature("autodoc", "	* Returns the current value of the zoom expressed with respect to SetViewMappingDefault----.

	:rtype: float
") Scale;
		Standard_Real Scale ();
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "	* Returns the current values of the anisotropic --axial-- scale factors.

	:param Sx:
	:type Sx: float &
	:param Sy:
	:type Sy: float &
	:param Sz:
	:type Sz: float &
	:rtype: None
") AxialScale;
		void AxialScale (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "	* Returns the height and width of the view.

	:param Width:
	:type Width: float &
	:param Height:
	:type Height: float &
	:rtype: None
") Size;
		void Size (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ZSize;
		%feature("autodoc", "	* Returns the Depth of the view .

	:rtype: float
") ZSize;
		Standard_Real ZSize ();
		%feature("compactdefaultargs") Eye;
		%feature("autodoc", "	* Returns the position of the eye.

	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") Eye;
		void Eye (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FocalReferencePoint;
		%feature("autodoc", "	* Returns the position of point which emanating the projections.

	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") FocalReferencePoint;
		void FocalReferencePoint (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ProjReferenceAxe;
		%feature("autodoc", "	* Returns the coordinate of the point --Xpix,Ypix-- in the view --XP,YP,ZP--, and the projection vector of the view passing by the point --for PerspectiveView--.

	:param Xpix:
	:type Xpix: int
	:param Ypix:
	:type Ypix: int
	:param XP:
	:type XP: float &
	:param YP:
	:type YP: float &
	:param ZP:
	:type ZP: float &
	:param VX:
	:type VX: float &
	:param VY:
	:type VY: float &
	:param VZ:
	:type VZ: float &
	:rtype: None
") ProjReferenceAxe;
		void ProjReferenceAxe (const Standard_Integer Xpix,const Standard_Integer Ypix,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Depth;
		%feature("autodoc", "	* Returns the Distance between the Eye and View Point.

	:rtype: float
") Depth;
		Standard_Real Depth ();
		%feature("compactdefaultargs") Proj;
		%feature("autodoc", "	* Returns the projection vector.

	:param Vx:
	:type Vx: float &
	:param Vy:
	:type Vy: float &
	:param Vz:
	:type Vz: float &
	:rtype: None
") Proj;
		void Proj (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") At;
		%feature("autodoc", "	* Returns the position of the view point.

	:param X:
	:type X: float &
	:param Y:
	:type Y: float &
	:param Z:
	:type Z: float &
	:rtype: None
") At;
		void At (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Up;
		%feature("autodoc", "	* Returns the vector giving the position of the high point.

	:param Vx:
	:type Vx: float &
	:param Vy:
	:type Vy: float &
	:param Vz:
	:type Vz: float &
	:rtype: None
") Up;
		void Up (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Twist;
		%feature("autodoc", "	* Returns in RADIANS the orientation of the view around the visual axis measured from the Y axis of the screen.

	:rtype: float
") Twist;
		Standard_Real Twist ();
		%feature("compactdefaultargs") ShadingModel;
		%feature("autodoc", "	* Returns the current shading model.

	:rtype: V3d_TypeOfShadingModel
") ShadingModel;
		V3d_TypeOfShadingModel ShadingModel ();
		%feature("compactdefaultargs") TextureEnv;
		%feature("autodoc", "	:rtype: Handle_Graphic3d_TextureEnv
") TextureEnv;
		Handle_Graphic3d_TextureEnv TextureEnv ();
		%feature("compactdefaultargs") Visualization;
		%feature("autodoc", "	* Returns the current visualisation mode.

	:rtype: V3d_TypeOfVisualization
") Visualization;
		V3d_TypeOfVisualization Visualization ();
		%feature("compactdefaultargs") IfMoreLights;
		%feature("autodoc", "	* Returns True if One light more can be activated in this View.

	:rtype: bool
") IfMoreLights;
		Standard_Boolean IfMoreLights ();
		%feature("compactdefaultargs") ActiveLightIterator;
		%feature("autodoc", "	* Return iterator for defined lights.

	:rtype: V3d_ListOfLightIterator
") ActiveLightIterator;
		V3d_ListOfLightIterator ActiveLightIterator ();
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "	* initializes an iteration on the active Lights.

	:rtype: None
") InitActiveLights;
		void InitActiveLights ();
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "	* returns true if there are more active Light--s-- to return.

	:rtype: bool
") MoreActiveLights;
		Standard_Boolean MoreActiveLights ();
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "	* Go to the next active Light --if there is not, ActiveLight will raise an exception--

	:rtype: None
") NextActiveLights;
		void NextActiveLights ();
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", "	:rtype: Handle_V3d_Light
") ActiveLight;
		Handle_V3d_Light ActiveLight ();
		%feature("compactdefaultargs") LightLimit;
		%feature("autodoc", "	* Returns the MAX number of light associated to the view.

	:rtype: int
") LightLimit;
		Standard_Integer LightLimit ();
		%feature("compactdefaultargs") Viewer;
		%feature("autodoc", "	* Returns the viewer in which the view has been created.

	:rtype: Handle_V3d_Viewer
") Viewer;
		Handle_V3d_Viewer Viewer ();
		%feature("compactdefaultargs") IfWindow;
		%feature("autodoc", "	* Returns True if MyView is associated with a window .

	:rtype: bool
") IfWindow;
		Standard_Boolean IfWindow ();
		%feature("compactdefaultargs") Window;
		%feature("autodoc", "	* Returns the Aspect Window associated with the view.

	:rtype: Handle_Aspect_Window
") Window;
		Handle_Aspect_Window Window ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	* Returns the Type of the View

	:rtype: V3d_TypeOfView
") Type;
		V3d_TypeOfView Type ();
		%feature("compactdefaultargs") Pan;
		%feature("autodoc", "	* Translates the center of the view along 'x' and 'y' axes of view projection. Can be used to perform interactive panning operation. In that case the DXp, DXp parameters specify panning relative to the point where the operation is started. @param theDXp [in] the relative panning on 'x' axis of view projection, in pixels. @param theDYp [in] the relative panning on 'y' axis of view projection, in pixels. @param theZoomFactor [in] the zooming factor. @param theToStart [in] pass True when starting panning to remember view state prior to panning for relative arguments. Passing 0 for relative panning parameter should return view panning to initial state. Performs update of view.

	:param theDXp:
	:type theDXp: int
	:param theDYp:
	:type theDYp: int
	:param theZoomFactor: default value is 1
	:type theZoomFactor: float
	:param theToStart: default value is Standard_True
	:type theToStart: bool
	:rtype: None
") Pan;
		void Pan (const Standard_Integer theDXp,const Standard_Integer theDYp,const Standard_Real theZoomFactor = 1,const Standard_Boolean theToStart = Standard_True);
		%feature("compactdefaultargs") Zoom;
		%feature("autodoc", "	* Zoom the view according to a zoom factor computed from the distance between the 2 mouse position. @param theXp1 [in] the x coordinate of first mouse position, in pixels. @param theYp1 [in] the y coordinate of first mouse position, in pixels. @param theXp2 [in] the x coordinate of second mouse position, in pixels. @param theYp2 [in] the y coordinate of second mouse position, in pixels.

	:param theXp1:
	:type theXp1: int
	:param theYp1:
	:type theYp1: int
	:param theXp2:
	:type theXp2: int
	:param theYp2:
	:type theYp2: int
	:rtype: None
") Zoom;
		void Zoom (const Standard_Integer theXp1,const Standard_Integer theYp1,const Standard_Integer theXp2,const Standard_Integer theYp2);
		%feature("compactdefaultargs") StartZoomAtPoint;
		%feature("autodoc", "	* Defines starting point for ZoomAtPoint view operation. @param theXp [in] the x mouse coordinate, in pixels. @param theYp [in] the y mouse coordinate, in pixels.

	:param theXp:
	:type theXp: int
	:param theYp:
	:type theYp: int
	:rtype: None
") StartZoomAtPoint;
		void StartZoomAtPoint (const Standard_Integer theXp,const Standard_Integer theYp);
		%feature("compactdefaultargs") ZoomAtPoint;
		%feature("autodoc", "	* Zooms the model at a pixel defined by the method StartZoomAtPoint----.

	:param theMouseStartX:
	:type theMouseStartX: int
	:param theMouseStartY:
	:type theMouseStartY: int
	:param theMouseEndX:
	:type theMouseEndX: int
	:param theMouseEndY:
	:type theMouseEndY: int
	:rtype: None
") ZoomAtPoint;
		void ZoomAtPoint (const Standard_Integer theMouseStartX,const Standard_Integer theMouseStartY,const Standard_Integer theMouseEndX,const Standard_Integer theMouseEndY);
		%feature("compactdefaultargs") AxialScale;
		%feature("autodoc", "	* Performs anisotropic scaling of <self> view along the given <Axis>. The scale factor is calculated on a basis of the mouse pointer displacement <Dx,Dy>. The calculated scale factor is then passed to SetAxialScale--Sx, Sy, Sz-- method.

	:param Dx:
	:type Dx: int
	:param Dy:
	:type Dy: int
	:param Axis:
	:type Axis: V3d_TypeOfAxe
	:rtype: None
") AxialScale;
		void AxialScale (const Standard_Integer Dx,const Standard_Integer Dy,const V3d_TypeOfAxe Axis);
		%feature("compactdefaultargs") StartRotation;
		%feature("autodoc", "	* Begin the rotation of the view around the screen axis according to the mouse position <X,Y>. Warning: Enable rotation around the Z screen axis when <zRotationThreshold> factor is > 0 soon the distance from the start point and the center of the view is > --medium viewSize * <zRotationThreshold> --. Generally a value of 0.4 is usable to rotate around XY screen axis inside the circular threshold area and to rotate around Z screen axis outside this area.

	:param X:
	:type X: int
	:param Y:
	:type Y: int
	:param zRotationThreshold: default value is 0.0
	:type zRotationThreshold: float
	:rtype: None
") StartRotation;
		void StartRotation (const Standard_Integer X,const Standard_Integer Y,const Standard_Real zRotationThreshold = 0.0);
		%feature("compactdefaultargs") Rotation;
		%feature("autodoc", "	* Continues the rotation of the view with an angle computed from the last and new mouse position <X,Y>.

	:param X:
	:type X: int
	:param Y:
	:type Y: int
	:rtype: None
") Rotation;
		void Rotation (const Standard_Integer X,const Standard_Integer Y);
		%feature("compactdefaultargs") SetFocale;
		%feature("autodoc", "	* Change View Plane Distance for Perspective Views Warning! raises TypeMismatch from Standard if the view is not a perspective view.

	:param Focale:
	:type Focale: float
	:rtype: None
") SetFocale;
		void SetFocale (const Standard_Real Focale);
		%feature("compactdefaultargs") Focale;
		%feature("autodoc", "	* Returns the View Plane Distance for Perspective Views

	:rtype: float
") Focale;
		Standard_Real Focale ();
		%feature("compactdefaultargs") View;
		%feature("autodoc", "	* Returns the associated Graphic3d view.

	:rtype: Handle_Graphic3d_CView
") View;
		Handle_Graphic3d_CView View ();
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "	* Switches computed HLR mode in the view.

	:param theMode:
	:type theMode: bool
	:rtype: None
") SetComputedMode;
		void SetComputedMode (const Standard_Boolean theMode);
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "	* Returns the computed HLR mode state.

	:rtype: bool
") ComputedMode;
		Standard_Boolean ComputedMode ();
		%feature("compactdefaultargs") WindowFitAll;
		%feature("autodoc", "	* idem than WindowFit

	:param Xmin:
	:type Xmin: int
	:param Ymin:
	:type Ymin: int
	:param Xmax:
	:type Xmax: int
	:param Ymax:
	:type Ymax: int
	:rtype: None
") WindowFitAll;
		void WindowFitAll (const Standard_Integer Xmin,const Standard_Integer Ymin,const Standard_Integer Xmax,const Standard_Integer Ymax);
		%feature("compactdefaultargs") SetGrid;
		%feature("autodoc", "	* Defines or Updates the definition of the grid in <self>

	:param aPlane:
	:type aPlane: gp_Ax3
	:param aGrid:
	:type aGrid: Handle_Aspect_Grid &
	:rtype: None
") SetGrid;
		void SetGrid (const gp_Ax3 & aPlane,const Handle_Aspect_Grid & aGrid);
		%feature("compactdefaultargs") SetGridActivity;
		%feature("autodoc", "	* Defines or Updates the activity of the grid in <self>

	:param aFlag:
	:type aFlag: bool
	:rtype: None
") SetGridActivity;
		void SetGridActivity (const Standard_Boolean aFlag);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	* dump the full contents of the view at the same scale in the file <theFile>. The file name extension must be one of '.png','.bmp','.jpg','.gif'. Returns False when the dump has failed

	:param theFile:
	:type theFile: char *
	:param theBufferType: default value is Graphic3d_BT_RGB
	:type theBufferType: Graphic3d_BufferType &
	:rtype: bool
") Dump;
		Standard_Boolean Dump (const char * theFile,const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB);
		%feature("compactdefaultargs") Export;
		%feature("autodoc", "	* Export scene into the one of the Vector graphics formats --SVG, PS, PDF...--. In contrast to Bitmaps, Vector graphics is scalable --so you may got quality benefits on printing to laser printer--. Notice however that results may differ a lot and do not contain some elements.

	:param theFileName:
	:type theFileName: char *
	:param theFormat:
	:type theFormat: Graphic3d_ExportFormat
	:param theSortType: default value is Graphic3d_ST_BSP_Tree
	:type theSortType: Graphic3d_SortType
	:rtype: bool
") Export;
		Standard_Boolean Export (const char * theFileName,const Graphic3d_ExportFormat theFormat,const Graphic3d_SortType theSortType = Graphic3d_ST_BSP_Tree);
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "	* Dumps the full contents of the view to a pixmap with specified parameters.

	:param theImage:
	:type theImage: Image_PixMap &
	:param theParams:
	:type theParams: V3d_ImageDumpOptions &
	:rtype: bool
") ToPixMap;
		Standard_Boolean ToPixMap (Image_PixMap & theImage,const V3d_ImageDumpOptions & theParams);
		%feature("compactdefaultargs") ToPixMap;
		%feature("autodoc", "	* Dumps the full contents of the view to a pixmap. @param theImage target image, will be re-allocated to match theWidth x theHeight @param theWidth target image width @param theHeight target image height @param theBufferType type of the view buffer to dump --color / depth-- @param theToAdjustAspect when true, active view aspect ratio will be overridden by --theWidth / theHeight-- @param theStereoOptions how to dump stereographic camera

	:param theImage:
	:type theImage: Image_PixMap &
	:param theWidth:
	:type theWidth: int
	:param theHeight:
	:type theHeight: int
	:param theBufferType: default value is Graphic3d_BT_RGB
	:type theBufferType: Graphic3d_BufferType &
	:param theToAdjustAspect: default value is Standard_True
	:type theToAdjustAspect: bool
	:param theStereoOptions: default value is V3d_SDO_MONO
	:type theStereoOptions: V3d_StereoDumpOptions
	:rtype: bool
") ToPixMap;
		Standard_Boolean ToPixMap (Image_PixMap & theImage,const Standard_Integer theWidth,const Standard_Integer theHeight,const Graphic3d_BufferType & theBufferType = Graphic3d_BT_RGB,const Standard_Boolean theToAdjustAspect = Standard_True,const V3d_StereoDumpOptions theStereoOptions = V3d_SDO_MONO);
		%feature("compactdefaultargs") SetBackFacingModel;
		%feature("autodoc", "	* Manages display of the back faces When <aModel> is TOBM_AUTOMATIC the object backfaces are displayed only for surface objects and never displayed for solid objects. this was the previous mode. <aModel> is TOBM_ALWAYS_DISPLAYED the object backfaces are always displayed both for surfaces or solids. <aModel> is TOBM_NEVER_DISPLAYED the object backfaces are never displayed.

	:param theModel: default value is V3d_TOBM_AUTOMATIC
	:type theModel: V3d_TypeOfBackfacingModel
	:rtype: None
") SetBackFacingModel;
		void SetBackFacingModel (const V3d_TypeOfBackfacingModel theModel = V3d_TOBM_AUTOMATIC);
		%feature("compactdefaultargs") BackFacingModel;
		%feature("autodoc", "	* Returns current state of the back faces display

	:rtype: V3d_TypeOfBackfacingModel
") BackFacingModel;
		V3d_TypeOfBackfacingModel BackFacingModel ();
		%feature("compactdefaultargs") AddClipPlane;
		%feature("autodoc", "	* Adds clip plane to the view. The composition of clip planes truncates the rendering space to convex volume. Number of supported clip planes can be consulted by PlaneLimit method of associated Graphic3d_GraphicDriver. Please be aware that the planes which exceed the limit are ignored during rendering. @param thePlane [in] the clip plane to be added to view.

	:param thePlane:
	:type thePlane: Handle_Graphic3d_ClipPlane &
	:rtype: void
") AddClipPlane;
		virtual void AddClipPlane (const Handle_Graphic3d_ClipPlane & thePlane);
		%feature("compactdefaultargs") RemoveClipPlane;
		%feature("autodoc", "	* Removes clip plane from the view. @param thePlane [in] the clip plane to be removed from view.

	:param thePlane:
	:type thePlane: Handle_Graphic3d_ClipPlane &
	:rtype: void
") RemoveClipPlane;
		virtual void RemoveClipPlane (const Handle_Graphic3d_ClipPlane & thePlane);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	* Sets sequence of clip planes to the view. The planes that have been set before are removed from the view. The composition of clip planes truncates the rendering space to convex volume. Number of supported clip planes can be consulted by InquirePlaneLimit method of Graphic3d_GraphicDriver. Please be aware that the planes that exceed the limit are ignored during rendering. @param thePlanes [in] the clip planes to set.

	:param thePlanes:
	:type thePlanes: Handle_Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Handle_Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") SetClipPlanes;
		%feature("autodoc", "	:param thePlanes:
	:type thePlanes: Graphic3d_SequenceOfHClipPlane &
	:rtype: None
") SetClipPlanes;
		void SetClipPlanes (const Graphic3d_SequenceOfHClipPlane & thePlanes);
		%feature("compactdefaultargs") ClipPlanes;
		%feature("autodoc", "	* Get clip planes. returns sequence clip planes that have been set for the view

	:rtype: Handle_Graphic3d_SequenceOfHClipPlane
") ClipPlanes;
		Handle_Graphic3d_SequenceOfHClipPlane ClipPlanes ();
		%feature("compactdefaultargs") PlaneLimit;
		%feature("autodoc", "	* Returns the MAX number of clipping planes associated to the view.

	:rtype: int
") PlaneLimit;
		Standard_Integer PlaneLimit ();
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "	* Change camera used by view.

	:param theCamera:
	:type theCamera: Handle_Graphic3d_Camera &
	:rtype: None
") SetCamera;
		void SetCamera (const Handle_Graphic3d_Camera & theCamera);
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "	* Returns camera object of the view. returns: handle to camera object, or NULL if 3D view does not use the camera approach.

	:rtype: Handle_Graphic3d_Camera
") Camera;
		Handle_Graphic3d_Camera Camera ();
		%feature("compactdefaultargs") DefaultCamera;
		%feature("autodoc", "	* Return default camera.

	:rtype: Handle_Graphic3d_Camera
") DefaultCamera;
		Handle_Graphic3d_Camera DefaultCamera ();
		%feature("compactdefaultargs") RenderingParams;
		%feature("autodoc", "	* Returns current rendering parameters and effect settings. By default it returns default parameters of current viewer. To define view-specific settings use method V3d_View::ChangeRenderingParams----. @sa V3d_Viewer::DefaultRenderingParams----

	:rtype: Graphic3d_RenderingParams
") RenderingParams;
		const Graphic3d_RenderingParams & RenderingParams ();
		%feature("compactdefaultargs") ChangeRenderingParams;
		%feature("autodoc", "	* Returns reference to current rendering parameters and effect settings.

	:rtype: Graphic3d_RenderingParams
") ChangeRenderingParams;
		Graphic3d_RenderingParams & ChangeRenderingParams ();
		%feature("compactdefaultargs") IsCullingEnabled;
		%feature("autodoc", "	* returns flag value of objects culling mechanism

	:rtype: bool
") IsCullingEnabled;
		Standard_Boolean IsCullingEnabled ();
		%feature("compactdefaultargs") SetFrustumCulling;
		%feature("autodoc", "	* Turn on/off automatic culling of objects outside frustrum --ON by default--

	:param theMode:
	:type theMode: bool
	:rtype: None
") SetFrustumCulling;
		void SetFrustumCulling (const Standard_Boolean theMode);
		%feature("compactdefaultargs") DiagnosticInformation;
		%feature("autodoc", "	* Fill in the dictionary with diagnostic info. Should be called within rendering thread. //! This API should be used only for user output or for creating automated reports. The format of returned information --e.g. key-value layout-- is NOT part of this API and can be changed at any time. Thus application should not parse returned information to weed out specific parameters. @param theDict destination map for information @param theFlags defines the information to be retrieved

	:param theDict:
	:type theDict: TColStd_IndexedDataMapOfStringString &
	:param theFlags:
	:type theFlags: Graphic3d_DiagnosticInfo
	:rtype: None
") DiagnosticInformation;
		void DiagnosticInformation (TColStd_IndexedDataMapOfStringString & theDict,Graphic3d_DiagnosticInfo theFlags);
};


%extend V3d_View {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_View(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_View::Handle_V3d_View %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_View;
class Handle_V3d_View : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_V3d_View();
        Handle_V3d_View(const Handle_V3d_View &aHandle);
        Handle_V3d_View(const V3d_View *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_View DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_View {
    V3d_View* _get_reference() {
    return (V3d_View*)$self->get();
    }
};

%extend Handle_V3d_View {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_View {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_Viewer;
class V3d_Viewer : public Standard_Transient {
	public:
		%feature("compactdefaultargs") V3d_Viewer;
		%feature("autodoc", "	* Create a Viewer with the given graphic driver and with default parameters: - View orientation: V3d_XposYnegZpos - View background: Quantity_NOC_GRAY30 - Shading model: V3d_GOURAUD

	:param theDriver:
	:type theDriver: Handle_Graphic3d_GraphicDriver &
	:rtype: None
") V3d_Viewer;
		 V3d_Viewer (const Handle_Graphic3d_GraphicDriver & theDriver);
		%feature("compactdefaultargs") IfMoreViews;
		%feature("autodoc", "	* Returns True if One View more can be defined in this Viewer.

	:rtype: bool
") IfMoreViews;
		Standard_Boolean IfMoreViews ();
		%feature("compactdefaultargs") CreateView;
		%feature("autodoc", "	* Creates a view in the viewer according to its default parameters.

	:rtype: Handle_V3d_View
") CreateView;
		Handle_V3d_View CreateView ();
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "	* Activates all of the views of a viewer attached to a window.

	:rtype: None
") SetViewOn;
		void SetViewOn ();
		%feature("compactdefaultargs") SetViewOn;
		%feature("autodoc", "	* Activates a particular view in the Viewer. Must be call if the Window attached to the view has been Deiconified.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") SetViewOn;
		void SetViewOn (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "	* Deactivates all the views of a Viewer attached to a window.

	:rtype: None
") SetViewOff;
		void SetViewOff ();
		%feature("compactdefaultargs") SetViewOff;
		%feature("autodoc", "	* Deactivates a particular view in the Viewer. Must be call if the Window attached to the view has been Iconified .

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") SetViewOff;
		void SetViewOff (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Deprecated, Redraw---- should be used instead.

	:rtype: None
") Update;
		void Update ();
		%feature("compactdefaultargs") Redraw;
		%feature("autodoc", "	* Redraws all the views of the Viewer even if no modification has taken place. Must be called if all the views of the Viewer are exposed, as for example in a global DeIconification.

	:rtype: None
") Redraw;
		void Redraw ();
		%feature("compactdefaultargs") RedrawImmediate;
		%feature("autodoc", "	* Updates layer of immediate presentations.

	:rtype: None
") RedrawImmediate;
		void RedrawImmediate ();
		%feature("compactdefaultargs") Invalidate;
		%feature("autodoc", "	* Invalidates viewer content but does not redraw it.

	:rtype: None
") Invalidate;
		void Invalidate ();
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Suppresses the Viewer.

	:rtype: None
") Remove;
		void Remove ();
		%feature("compactdefaultargs") Driver;
		%feature("autodoc", "	* Return Graphic Driver instance.

	:rtype: Handle_Graphic3d_GraphicDriver
") Driver;
		Handle_Graphic3d_GraphicDriver Driver ();
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "	* Returns the structure manager associated to this viewer.

	:rtype: Handle_Graphic3d_StructureManager
") StructureManager;
		Handle_Graphic3d_StructureManager StructureManager ();
		%feature("compactdefaultargs") DefaultRenderingParams;
		%feature("autodoc", "	* Return default Rendering Parameters. By default these parameters are set in a new V3d_View.

	:rtype: Graphic3d_RenderingParams
") DefaultRenderingParams;
		const Graphic3d_RenderingParams & DefaultRenderingParams ();
		%feature("compactdefaultargs") SetDefaultRenderingParams;
		%feature("autodoc", "	* Set default Rendering Parameters.

	:param theParams:
	:type theParams: Graphic3d_RenderingParams &
	:rtype: None
") SetDefaultRenderingParams;
		void SetDefaultRenderingParams (const Graphic3d_RenderingParams & theParams);
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "	* Defines the default background colour of views attached to the viewer by supplying the color object

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: None
") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") GetGradientBackground;
		%feature("autodoc", "	* Returns the gradient background of the view.

	:rtype: Aspect_GradientBackground
") GetGradientBackground;
		const Aspect_GradientBackground & GetGradientBackground ();
		%feature("compactdefaultargs") SetDefaultBgGradientColors;
		%feature("autodoc", "	* Defines the default gradient background colours of views attached to the viewer by supplying the colour objects

	:param theColor1:
	:type theColor1: Quantity_Color &
	:param theColor2:
	:type theColor2: Quantity_Color &
	:param theFillStyle: default value is Aspect_GFM_HOR
	:type theFillStyle: Aspect_GradientFillMethod
	:rtype: None
") SetDefaultBgGradientColors;
		void SetDefaultBgGradientColors (const Quantity_Color & theColor1,const Quantity_Color & theColor2,const Aspect_GradientFillMethod theFillStyle = Aspect_GFM_HOR);
		%feature("compactdefaultargs") DefaultViewSize;
		%feature("autodoc", "	* Returns the default size of the view.

	:rtype: float
") DefaultViewSize;
		Standard_Real DefaultViewSize ();
		%feature("compactdefaultargs") SetDefaultViewSize;
		%feature("autodoc", "	* Gives a default size for the creation of views of the viewer.

	:param theSize:
	:type theSize: float
	:rtype: None
") SetDefaultViewSize;
		void SetDefaultViewSize (const Standard_Real theSize);
		%feature("compactdefaultargs") DefaultViewProj;
		%feature("autodoc", "	* Returns the default Projection.

	:rtype: V3d_TypeOfOrientation
") DefaultViewProj;
		V3d_TypeOfOrientation DefaultViewProj ();
		%feature("compactdefaultargs") SetDefaultViewProj;
		%feature("autodoc", "	* Sets the default projection for creating views in the viewer.

	:param theOrientation:
	:type theOrientation: V3d_TypeOfOrientation
	:rtype: None
") SetDefaultViewProj;
		void SetDefaultViewProj (const V3d_TypeOfOrientation theOrientation);
		%feature("compactdefaultargs") DefaultVisualization;
		%feature("autodoc", "	* Returns the default type of Visualization.

	:rtype: V3d_TypeOfVisualization
") DefaultVisualization;
		V3d_TypeOfVisualization DefaultVisualization ();
		%feature("compactdefaultargs") SetDefaultVisualization;
		%feature("autodoc", "	* Gives the default visualization mode.

	:param theType:
	:type theType: V3d_TypeOfVisualization
	:rtype: None
") SetDefaultVisualization;
		void SetDefaultVisualization (const V3d_TypeOfVisualization theType);
		%feature("compactdefaultargs") DefaultShadingModel;
		%feature("autodoc", "	* Returns the default type of Shading

	:rtype: V3d_TypeOfShadingModel
") DefaultShadingModel;
		V3d_TypeOfShadingModel DefaultShadingModel ();
		%feature("compactdefaultargs") SetDefaultShadingModel;
		%feature("autodoc", "	* Gives the default type of SHADING.

	:param theType:
	:type theType: V3d_TypeOfShadingModel
	:rtype: None
") SetDefaultShadingModel;
		void SetDefaultShadingModel (const V3d_TypeOfShadingModel theType);
		%feature("compactdefaultargs") SetDefaultTypeOfView;
		%feature("autodoc", "	:param theType:
	:type theType: V3d_TypeOfView
	:rtype: None
") SetDefaultTypeOfView;
		void SetDefaultTypeOfView (const V3d_TypeOfView theType);
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", "	* Returns the default background colour object.

	:rtype: Quantity_Color
") DefaultBackgroundColor;
		Quantity_Color DefaultBackgroundColor ();
		%feature("compactdefaultargs") DefaultBgGradientColors;
		%feature("autodoc", "	* Returns the gradient background colour objects of the view.

	:param theColor1:
	:type theColor1: Quantity_Color &
	:param theColor2:
	:type theColor2: Quantity_Color &
	:rtype: None
") DefaultBgGradientColors;
		void DefaultBgGradientColors (Quantity_Color & theColor1,Quantity_Color & theColor2);
		%feature("compactdefaultargs") GetAllZLayers;
		%feature("autodoc", "	* Return all Z layer ids in sequence ordered by overlay level from lowest layer to highest -- foreground --. The first layer ID in sequence is the default layer that can't be removed.

	:param theLayerSeq:
	:type theLayerSeq: TColStd_SequenceOfInteger &
	:rtype: None
") GetAllZLayers;
		void GetAllZLayers (TColStd_SequenceOfInteger & theLayerSeq);
		%feature("compactdefaultargs") AddZLayer;
		%feature("autodoc", "	* Add a new top-level Z layer to all managed views and get its ID as <theLayerId> value. The Z layers are controlled entirely by viewer, it is not possible to add a layer to a particular view. The method returns Standard_False if the layer can not be created. The layer mechanism allows to display structures in higher layers in overlay of structures in lower layers.

	:param theLayerId:
	:type theLayerId: int &
	:rtype: bool
") AddZLayer;
		Standard_Boolean AddZLayer (Standard_Integer &OutValue);
		%feature("compactdefaultargs") RemoveZLayer;
		%feature("autodoc", "	* Remove Z layer with ID <theLayerId>. Method returns Standard_False if the layer can not be removed or doesn't exists. By default, there are always default bottom-level layer that can't be removed.

	:param theLayerId:
	:type theLayerId: int
	:rtype: bool
") RemoveZLayer;
		Standard_Boolean RemoveZLayer (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") ZLayerSettings;
		%feature("autodoc", "	* Returns the settings of a single Z layer.

	:param theLayerId:
	:type theLayerId: int
	:rtype: Graphic3d_ZLayerSettings
") ZLayerSettings;
		Graphic3d_ZLayerSettings ZLayerSettings (const Standard_Integer theLayerId);
		%feature("compactdefaultargs") SetZLayerSettings;
		%feature("autodoc", "	* Sets the settings for a single Z layer.

	:param theLayerId:
	:type theLayerId: int
	:param theSettings:
	:type theSettings: Graphic3d_ZLayerSettings &
	:rtype: None
") SetZLayerSettings;
		void SetZLayerSettings (const Standard_Integer theLayerId,const Graphic3d_ZLayerSettings & theSettings);
		%feature("compactdefaultargs") ActiveViewIterator;
		%feature("autodoc", "	* Return an iterator for active views.

	:rtype: V3d_ListOfViewIterator
") ActiveViewIterator;
		V3d_ListOfViewIterator ActiveViewIterator ();
		%feature("compactdefaultargs") InitActiveViews;
		%feature("autodoc", "	* Initializes an internal iterator on the active views.

	:rtype: None
") InitActiveViews;
		void InitActiveViews ();
		%feature("compactdefaultargs") MoreActiveViews;
		%feature("autodoc", "	* Returns true if there are more active view--s-- to return.

	:rtype: bool
") MoreActiveViews;
		Standard_Boolean MoreActiveViews ();
		%feature("compactdefaultargs") NextActiveViews;
		%feature("autodoc", "	* Go to the next active view --if there is not, ActiveView will raise an exception--

	:rtype: None
") NextActiveViews;
		void NextActiveViews ();
		%feature("compactdefaultargs") ActiveView;
		%feature("autodoc", "	:rtype: Handle_V3d_View
") ActiveView;
		Handle_V3d_View ActiveView ();
		%feature("compactdefaultargs") LastActiveView;
		%feature("autodoc", "	* returns true if there is only one active view.

	:rtype: bool
") LastActiveView;
		Standard_Boolean LastActiveView ();
		%feature("compactdefaultargs") DefinedViewIterator;
		%feature("autodoc", "	* Return an iterator for defined views.

	:rtype: V3d_ListOfViewIterator
") DefinedViewIterator;
		V3d_ListOfViewIterator DefinedViewIterator ();
		%feature("compactdefaultargs") InitDefinedViews;
		%feature("autodoc", "	* Initializes an internal iterator on the Defined views.

	:rtype: None
") InitDefinedViews;
		void InitDefinedViews ();
		%feature("compactdefaultargs") MoreDefinedViews;
		%feature("autodoc", "	* returns true if there are more Defined view--s-- to return.

	:rtype: bool
") MoreDefinedViews;
		Standard_Boolean MoreDefinedViews ();
		%feature("compactdefaultargs") NextDefinedViews;
		%feature("autodoc", "	* Go to the next Defined view --if there is not, DefinedView will raise an exception--

	:rtype: None
") NextDefinedViews;
		void NextDefinedViews ();
		%feature("compactdefaultargs") DefinedView;
		%feature("autodoc", "	:rtype: Handle_V3d_View
") DefinedView;
		Handle_V3d_View DefinedView ();
		%feature("compactdefaultargs") SetDefaultLights;
		%feature("autodoc", "	* @name lights management Defines default lights: positional-light 0.3 0. 0. directional-light V3d_XnegYposZpos directional-light V3d_XnegYneg ambient-light

	:rtype: None
") SetDefaultLights;
		void SetDefaultLights ();
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates MyLight in the viewer.

	:param theLight:
	:type theLight: Handle_V3d_Light &
	:rtype: None
") SetLightOn;
		void SetLightOn (const Handle_V3d_Light & theLight);
		%feature("compactdefaultargs") SetLightOn;
		%feature("autodoc", "	* Activates all the lights defined in this viewer.

	:rtype: None
") SetLightOn;
		void SetLightOn ();
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Deactivates MyLight in this viewer.

	:param theLight:
	:type theLight: Handle_V3d_Light &
	:rtype: None
") SetLightOff;
		void SetLightOff (const Handle_V3d_Light & theLight);
		%feature("compactdefaultargs") SetLightOff;
		%feature("autodoc", "	* Deactivate all the Lights defined in this viewer.

	:rtype: None
") SetLightOff;
		void SetLightOff ();
		%feature("compactdefaultargs") DelLight;
		%feature("autodoc", "	* Delete Light in Sequence Of Lights.

	:param theLight:
	:type theLight: Handle_V3d_Light &
	:rtype: None
") DelLight;
		void DelLight (const Handle_V3d_Light & theLight);
		%feature("compactdefaultargs") UpdateLights;
		%feature("autodoc", "	* Updates the lights of all the views of a viewer.

	:rtype: None
") UpdateLights;
		void UpdateLights ();
		%feature("compactdefaultargs") IsGlobalLight;
		%feature("autodoc", "	:param TheLight:
	:type TheLight: Handle_V3d_Light &
	:rtype: bool
") IsGlobalLight;
		Standard_Boolean IsGlobalLight (const Handle_V3d_Light & TheLight);
		%feature("compactdefaultargs") ActiveLightIterator;
		%feature("autodoc", "	* Return an iterator for defined lights.

	:rtype: V3d_ListOfLightIterator
") ActiveLightIterator;
		V3d_ListOfLightIterator ActiveLightIterator ();
		%feature("compactdefaultargs") InitActiveLights;
		%feature("autodoc", "	* Initializes an internal iteratator on the active Lights.

	:rtype: None
") InitActiveLights;
		void InitActiveLights ();
		%feature("compactdefaultargs") MoreActiveLights;
		%feature("autodoc", "	* returns true if there are more active Light--s-- to return.

	:rtype: bool
") MoreActiveLights;
		Standard_Boolean MoreActiveLights ();
		%feature("compactdefaultargs") NextActiveLights;
		%feature("autodoc", "	* Go to the next active Light --if there is not, ActiveLight---- will raise an exception--

	:rtype: None
") NextActiveLights;
		void NextActiveLights ();
		%feature("compactdefaultargs") ActiveLight;
		%feature("autodoc", "	:rtype: Handle_V3d_Light
") ActiveLight;
		Handle_V3d_Light ActiveLight ();
		%feature("compactdefaultargs") DefinedLightIterator;
		%feature("autodoc", "	* Return an iterator for defined lights.

	:rtype: V3d_ListOfLightIterator
") DefinedLightIterator;
		V3d_ListOfLightIterator DefinedLightIterator ();
		%feature("compactdefaultargs") InitDefinedLights;
		%feature("autodoc", "	* Initializes an internal iterattor on the Defined Lights.

	:rtype: None
") InitDefinedLights;
		void InitDefinedLights ();
		%feature("compactdefaultargs") MoreDefinedLights;
		%feature("autodoc", "	* Returns true if there are more Defined Light--s-- to return.

	:rtype: bool
") MoreDefinedLights;
		Standard_Boolean MoreDefinedLights ();
		%feature("compactdefaultargs") NextDefinedLights;
		%feature("autodoc", "	* Go to the next Defined Light --if there is not, DefinedLight---- will raise an exception--

	:rtype: None
") NextDefinedLights;
		void NextDefinedLights ();
		%feature("compactdefaultargs") DefinedLight;
		%feature("autodoc", "	:rtype: Handle_V3d_Light
") DefinedLight;
		Handle_V3d_Light DefinedLight ();
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* @name objects management Erase all Objects in All the views.

	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") UnHighlight;
		%feature("autodoc", "	* UnHighlight all Objects in All the views.

	:rtype: None
") UnHighlight;
		void UnHighlight ();
		%feature("compactdefaultargs") ComputedMode;
		%feature("autodoc", "	* returns true if the computed mode can be used.

	:rtype: bool
") ComputedMode;
		Standard_Boolean ComputedMode ();
		%feature("compactdefaultargs") SetComputedMode;
		%feature("autodoc", "	* Set if the computed mode can be used.

	:param theMode:
	:type theMode: bool
	:rtype: None
") SetComputedMode;
		void SetComputedMode (const Standard_Boolean theMode);
		%feature("compactdefaultargs") DefaultComputedMode;
		%feature("autodoc", "	* returns true if by default the computed mode must be used.

	:rtype: bool
") DefaultComputedMode;
		Standard_Boolean DefaultComputedMode ();
		%feature("compactdefaultargs") SetDefaultComputedMode;
		%feature("autodoc", "	* Set if by default the computed mode must be used.

	:param theMode:
	:type theMode: bool
	:rtype: None
") SetDefaultComputedMode;
		void SetDefaultComputedMode (const Standard_Boolean theMode);
		%feature("compactdefaultargs") PrivilegedPlane;
		%feature("autodoc", "	* @name privileged plane management

	:rtype: gp_Ax3
") PrivilegedPlane;
		gp_Ax3 PrivilegedPlane ();
		%feature("compactdefaultargs") SetPrivilegedPlane;
		%feature("autodoc", "	:param thePlane:
	:type thePlane: gp_Ax3
	:rtype: None
") SetPrivilegedPlane;
		void SetPrivilegedPlane (const gp_Ax3 & thePlane);
		%feature("compactdefaultargs") DisplayPrivilegedPlane;
		%feature("autodoc", "	:param theOnOff:
	:type theOnOff: bool
	:param theSize: default value is 1
	:type theSize: float
	:rtype: None
") DisplayPrivilegedPlane;
		void DisplayPrivilegedPlane (const Standard_Boolean theOnOff,const Standard_Real theSize = 1);
		%feature("compactdefaultargs") ActivateGrid;
		%feature("autodoc", "	* @name grid management Activates the grid in all views of <self>.

	:param aGridType:
	:type aGridType: Aspect_GridType
	:param aGridDrawMode:
	:type aGridDrawMode: Aspect_GridDrawMode
	:rtype: None
") ActivateGrid;
		void ActivateGrid (const Aspect_GridType aGridType,const Aspect_GridDrawMode aGridDrawMode);
		%feature("compactdefaultargs") DeactivateGrid;
		%feature("autodoc", "	* Deactivates the grid in all views of <self>.

	:rtype: None
") DeactivateGrid;
		void DeactivateGrid ();
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "	* Show/Don't show grid echo to the hit point. If True,the grid echo will be shown at ConvertToGrid---- time.

	:param showGrid: default value is Standard_True
	:type showGrid: bool
	:rtype: None
") SetGridEcho;
		void SetGridEcho (const Standard_Boolean showGrid = Standard_True);
		%feature("compactdefaultargs") SetGridEcho;
		%feature("autodoc", "	* Show grid echo <aMarker> to the hit point. Warning: When the grid echo marker is not set, a default marker is build with the attributes: marker type : Aspect_TOM_STAR marker color : Quantity_NOC_GRAY90 marker size : 3.0

	:param aMarker:
	:type aMarker: Handle_Graphic3d_AspectMarker3d &
	:rtype: None
") SetGridEcho;
		void SetGridEcho (const Handle_Graphic3d_AspectMarker3d & aMarker);
		%feature("compactdefaultargs") GridEcho;
		%feature("autodoc", "	* Returns True when grid echo must be displayed at hit point.

	:rtype: bool
") GridEcho;
		Standard_Boolean GridEcho ();
		%feature("compactdefaultargs") IsActive;
		%feature("autodoc", "	* Returns Standard_True if a grid is activated in <self>.

	:rtype: bool
") IsActive;
		Standard_Boolean IsActive ();
		%feature("compactdefaultargs") Grid;
		%feature("autodoc", "	* Returns the defined grid in <self>.

	:rtype: Handle_Aspect_Grid
") Grid;
		Handle_Aspect_Grid Grid ();
		%feature("compactdefaultargs") GridType;
		%feature("autodoc", "	* Returns the current grid type defined in <self>.

	:rtype: Aspect_GridType
") GridType;
		Aspect_GridType GridType ();
		%feature("compactdefaultargs") GridDrawMode;
		%feature("autodoc", "	* Returns the current grid draw mode defined in <self>.

	:rtype: Aspect_GridDrawMode
") GridDrawMode;
		Aspect_GridDrawMode GridDrawMode ();
		%feature("compactdefaultargs") RectangularGridValues;
		%feature("autodoc", "	* Returns the definition of the rectangular grid.

	:param XOrigin:
	:type XOrigin: float &
	:param YOrigin:
	:type YOrigin: float &
	:param XStep:
	:type XStep: float &
	:param YStep:
	:type YStep: float &
	:param RotationAngle:
	:type RotationAngle: float &
	:rtype: None
") RectangularGridValues;
		void RectangularGridValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetRectangularGridValues;
		%feature("autodoc", "	* Sets the definition of the rectangular grid. <XOrigin>, <YOrigin> defines the origin of the grid. <XStep> defines the interval between 2 vertical lines. <YStep> defines the interval between 2 horizontal lines. <RotationAngle> defines the rotation angle of the grid.

	:param XOrigin:
	:type XOrigin: float
	:param YOrigin:
	:type YOrigin: float
	:param XStep:
	:type XStep: float
	:param YStep:
	:type YStep: float
	:param RotationAngle:
	:type RotationAngle: float
	:rtype: None
") SetRectangularGridValues;
		void SetRectangularGridValues (const Standard_Real XOrigin,const Standard_Real YOrigin,const Standard_Real XStep,const Standard_Real YStep,const Standard_Real RotationAngle);
		%feature("compactdefaultargs") CircularGridValues;
		%feature("autodoc", "	* Returns the definition of the circular grid.

	:param XOrigin:
	:type XOrigin: float &
	:param YOrigin:
	:type YOrigin: float &
	:param RadiusStep:
	:type RadiusStep: float &
	:param DivisionNumber:
	:type DivisionNumber: int &
	:param RotationAngle:
	:type RotationAngle: float &
	:rtype: None
") CircularGridValues;
		void CircularGridValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetCircularGridValues;
		%feature("autodoc", "	* Sets the definition of the circular grid. <XOrigin>, <YOrigin> defines the origin of the grid. <RadiusStep> defines the interval between 2 circles. <DivisionNumber> defines the section number of one half circle. <RotationAngle> defines the rotation angle of the grid.

	:param XOrigin:
	:type XOrigin: float
	:param YOrigin:
	:type YOrigin: float
	:param RadiusStep:
	:type RadiusStep: float
	:param DivisionNumber:
	:type DivisionNumber: int
	:param RotationAngle:
	:type RotationAngle: float
	:rtype: None
") SetCircularGridValues;
		void SetCircularGridValues (const Standard_Real XOrigin,const Standard_Real YOrigin,const Standard_Real RadiusStep,const Standard_Integer DivisionNumber,const Standard_Real RotationAngle);
		%feature("compactdefaultargs") CircularGridGraphicValues;
		%feature("autodoc", "	* Returns the location and the size of the grid.

	:param Radius:
	:type Radius: float &
	:param OffSet:
	:type OffSet: float &
	:rtype: None
") CircularGridGraphicValues;
		void CircularGridGraphicValues (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetCircularGridGraphicValues;
		%feature("autodoc", "	* Sets the location and the size of the grid. <XSize> defines the width of the grid. <YSize> defines the height of the grid. <OffSet> defines the displacement along the plane normal.

	:param Radius:
	:type Radius: float
	:param OffSet:
	:type OffSet: float
	:rtype: None
") SetCircularGridGraphicValues;
		void SetCircularGridGraphicValues (const Standard_Real Radius,const Standard_Real OffSet);
		%feature("compactdefaultargs") RectangularGridGraphicValues;
		%feature("autodoc", "	* Returns the location and the size of the grid.

	:param XSize:
	:type XSize: float &
	:param YSize:
	:type YSize: float &
	:param OffSet:
	:type OffSet: float &
	:rtype: None
") RectangularGridGraphicValues;
		void RectangularGridGraphicValues (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") SetRectangularGridGraphicValues;
		%feature("autodoc", "	* Sets the location and the size of the grid. <XSize> defines the width of the grid. <YSize> defines the height of the grid. <OffSet> defines the displacement along the plane normal.

	:param XSize:
	:type XSize: float
	:param YSize:
	:type YSize: float
	:param OffSet:
	:type OffSet: float
	:rtype: None
") SetRectangularGridGraphicValues;
		void SetRectangularGridGraphicValues (const Standard_Real XSize,const Standard_Real YSize,const Standard_Real OffSet);
		%feature("compactdefaultargs") ShowGridEcho;
		%feature("autodoc", "	* Display grid echo at requested point in the view.

	:param theView:
	:type theView: Handle_V3d_View &
	:param thePoint:
	:type thePoint: Graphic3d_Vertex &
	:rtype: None
") ShowGridEcho;
		void ShowGridEcho (const Handle_V3d_View & theView,const Graphic3d_Vertex & thePoint);
		%feature("compactdefaultargs") HideGridEcho;
		%feature("autodoc", "	* Temporarly hide grid echo.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") HideGridEcho;
		void HideGridEcho (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") V3d_Viewer;
		%feature("autodoc", "	* @name deprecated methods

	:param theDriver:
	:type theDriver: Handle_Graphic3d_GraphicDriver &
	:param theName:
	:type theName: Standard_ExtString
	:param theDomain: default value is ""
	:type theDomain: char *
	:param theViewSize: default value is 1000.0
	:type theViewSize: float
	:param theViewProj: default value is V3d_XposYnegZpos
	:type theViewProj: V3d_TypeOfOrientation
	:param theViewBackground: default value is Quantity_NOC_GRAY30
	:type theViewBackground: Quantity_Color &
	:param theVisualization: default value is V3d_ZBUFFER
	:type theVisualization: V3d_TypeOfVisualization
	:param theShadingModel: default value is V3d_GOURAUD
	:type theShadingModel: V3d_TypeOfShadingModel
	:param theComputedMode: default value is Standard_True
	:type theComputedMode: bool
	:param theDefaultComputedMode: default value is Standard_True
	:type theDefaultComputedMode: bool
	:rtype: None
") V3d_Viewer;
		 V3d_Viewer (const Handle_Graphic3d_GraphicDriver & theDriver,const Standard_ExtString theName,const char * theDomain = "",const Standard_Real theViewSize = 1000.0,const V3d_TypeOfOrientation theViewProj = V3d_XposYnegZpos,const Quantity_Color & theViewBackground = Quantity_NOC_GRAY30,const V3d_TypeOfVisualization theVisualization = V3d_ZBUFFER,const V3d_TypeOfShadingModel theShadingModel = V3d_GOURAUD,const Standard_Boolean theComputedMode = Standard_True,const Standard_Boolean theDefaultComputedMode = Standard_True);
		%feature("compactdefaultargs") SetDefaultBackgroundColor;
		%feature("autodoc", "	* Defines the default base colour of views attached to the Viewer by supplying the type of colour definition and the three component values.

	:param theType:
	:type theType: Quantity_TypeOfColor
	:param theV1:
	:type theV1: float
	:param theV2:
	:type theV2: float
	:param theV3:
	:type theV3: float
	:rtype: None
") SetDefaultBackgroundColor;
		void SetDefaultBackgroundColor (const Quantity_TypeOfColor theType,const Standard_Real theV1,const Standard_Real theV2,const Standard_Real theV3);
		%feature("compactdefaultargs") DefaultBackgroundColor;
		%feature("autodoc", "	:param theType:
	:type theType: Quantity_TypeOfColor
	:param theV1:
	:type theV1: float &
	:param theV2:
	:type theV2: float &
	:param theV3:
	:type theV3: float &
	:rtype: None
") DefaultBackgroundColor;
		void DefaultBackgroundColor (const Quantity_TypeOfColor theType,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend V3d_Viewer {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_Viewer(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_Viewer::Handle_V3d_Viewer %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_Viewer;
class Handle_V3d_Viewer : public Handle_Standard_Transient {

    public:
        // constructors
        Handle_V3d_Viewer();
        Handle_V3d_Viewer(const Handle_V3d_Viewer &aHandle);
        Handle_V3d_Viewer(const V3d_Viewer *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_Viewer DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_Viewer {
    V3d_Viewer* _get_reference() {
    return (V3d_Viewer*)$self->get();
    }
};

%extend Handle_V3d_Viewer {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_Viewer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_AmbientLight;
class V3d_AmbientLight : public V3d_Light {
	public:
		%feature("compactdefaultargs") V3d_AmbientLight;
		%feature("autodoc", "	* Constructs an ambient light source in the viewer. The default Color of this light source is WHITE.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color &
	:rtype: None
") V3d_AmbientLight;
		 V3d_AmbientLight (const Handle_V3d_Viewer & theViewer,const Quantity_Color & theColor = Quantity_NOC_WHITE);
};


%extend V3d_AmbientLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_AmbientLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_AmbientLight::Handle_V3d_AmbientLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_AmbientLight;
class Handle_V3d_AmbientLight : public Handle_V3d_Light {

    public:
        // constructors
        Handle_V3d_AmbientLight();
        Handle_V3d_AmbientLight(const Handle_V3d_AmbientLight &aHandle);
        Handle_V3d_AmbientLight(const V3d_AmbientLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_AmbientLight DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_AmbientLight {
    V3d_AmbientLight* _get_reference() {
    return (V3d_AmbientLight*)$self->get();
    }
};

%extend Handle_V3d_AmbientLight {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_AmbientLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_PositionLight;
class V3d_PositionLight : public V3d_Light {
	public:
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Defines the position of the light source. Should be redefined!

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: void
") SetPosition;
		virtual void SetPosition (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);
		%feature("compactdefaultargs") SetTarget;
		%feature("autodoc", "	* Defines the target of the light --the center of the sphere--.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None
") SetTarget;
		void SetTarget (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);
		%feature("compactdefaultargs") SetRadius;
		%feature("autodoc", "	* Define the radius.

	:param theRadius:
	:type theRadius: float
	:rtype: None
") SetRadius;
		void SetRadius (const Standard_Real theRadius);
		%feature("compactdefaultargs") OnHideFace;
		%feature("autodoc", "	* Calculate the position of the light, on the hide face of the picking sphere.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") OnHideFace;
		void OnHideFace (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") OnSeeFace;
		%feature("autodoc", "	* Calculate the position of the light, on the seen face of the picking sphere.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") OnSeeFace;
		void OnSeeFace (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") Tracking;
		%feature("autodoc", "	* Tracking the light position, or the light space, or the radius of the light space, that depends of initial picking 'theWhatPick' --see the pick method--. If theWhatPick is SPACELIGHT, then the parameters theXpix, theYpix are the coordinates of a translation vector.

	:param theView:
	:type theView: Handle_V3d_View &
	:param theWathPick:
	:type theWathPick: V3d_TypeOfPickLight
	:param theXpix:
	:type theXpix: int
	:param theYpix:
	:type theYpix: int
	:rtype: None
") Tracking;
		void Tracking (const Handle_V3d_View & theView,const V3d_TypeOfPickLight theWathPick,const Standard_Integer theXpix,const Standard_Integer theYpix);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the graphic structure of light source in the chosen view. We have three type of representation - SIMPLE : Only the light source is displayed. - PARTIAL : The light source and the light space are displayed. - COMPLETE : The light source, the light space and the radius of light space are displayed. We can choose the 'SAMELAST' as parameter of representation In this case the graphic structure representation will be the last displayed.

	:param theView:
	:type theView: Handle_V3d_View &
	:param theRepresentation: default value is V3d_SIMPLE
	:type theRepresentation: V3d_TypeOfRepresentation
	:rtype: void
") Display;
		virtual void Display (const Handle_V3d_View & theView,const V3d_TypeOfRepresentation theRepresentation = V3d_SIMPLE);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* Erase the graphic structure of light source.

	:rtype: None
") Erase;
		void Erase ();
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "	* Returns the radius of the picking sphere.

	:rtype: float
") Radius;
		Standard_Real Radius ();
		%feature("compactdefaultargs") SeeOrHide;
		%feature("autodoc", "	* Returns the visibility status If True the source is visible. If False it's hidden.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: bool
") SeeOrHide;
		Standard_Boolean SeeOrHide (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position of the light source.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:param theZ:
	:type theZ: float &
	:rtype: void
") Position;
		virtual void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Target;
		%feature("autodoc", "	* Returns the position of the target of the light source.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:param theZ:
	:type theZ: float &
	:rtype: None
") Target;
		void Target (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend V3d_PositionLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_PositionLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_PositionLight::Handle_V3d_PositionLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_PositionLight;
class Handle_V3d_PositionLight : public Handle_V3d_Light {

    public:
        // constructors
        Handle_V3d_PositionLight();
        Handle_V3d_PositionLight(const Handle_V3d_PositionLight &aHandle);
        Handle_V3d_PositionLight(const V3d_PositionLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_PositionLight DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_PositionLight {
    V3d_PositionLight* _get_reference() {
    return (V3d_PositionLight*)$self->get();
    }
};

%extend Handle_V3d_PositionLight {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_PositionLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_DirectionalLight;
class V3d_DirectionalLight : public V3d_PositionLight {
	public:
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "	* Creates a directional light source in the viewer.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theDirection: default value is V3d_XposYposZpos
	:type theDirection: V3d_TypeOfOrientation
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color &
	:param theIsHeadlight: default value is Standard_False
	:type theIsHeadlight: bool
	:rtype: None
") V3d_DirectionalLight;
		 V3d_DirectionalLight (const Handle_V3d_Viewer & theViewer,const V3d_TypeOfOrientation theDirection = V3d_XposYposZpos,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Boolean theIsHeadlight = Standard_False);
		%feature("compactdefaultargs") V3d_DirectionalLight;
		%feature("autodoc", "	* Creates a directional light source in the viewer. theXt, theYt, theZt : Coordinate of light source Target. theXp, theYp, theZp : Coordinate of light source Position. The others parameters describe before.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theXt:
	:type theXt: float
	:param theYt:
	:type theYt: float
	:param theZt:
	:type theZt: float
	:param theXp:
	:type theXp: float
	:param theYp:
	:type theYp: float
	:param theZp:
	:type theZp: float
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color &
	:param theIsHeadlight: default value is Standard_False
	:type theIsHeadlight: bool
	:rtype: None
") V3d_DirectionalLight;
		 V3d_DirectionalLight (const Handle_V3d_Viewer & theViewer,const Standard_Real theXt,const Standard_Real theYt,const Standard_Real theZt,const Standard_Real theXp,const Standard_Real theYp,const Standard_Real theZp,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Boolean theIsHeadlight = Standard_False);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Defines the direction of the light source by a predefined orientation.

	:param theDirection:
	:type theDirection: V3d_TypeOfOrientation
	:rtype: None
") SetDirection;
		void SetDirection (const V3d_TypeOfOrientation theDirection);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Defines the direction of the light source by the predefined vector theXm, theYm, theZm. Warning: raises BadValue from V3d if the vector is null.

	:param theXm:
	:type theXm: float
	:param theYm:
	:type theYm: float
	:param theZm:
	:type theZm: float
	:rtype: None
") SetDirection;
		void SetDirection (const Standard_Real theXm,const Standard_Real theYm,const Standard_Real theZm);
		%feature("compactdefaultargs") SetDisplayPosition;
		%feature("autodoc", "	* Defines the point of light source representation.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: None
") SetDisplayPosition;
		void SetDisplayPosition (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Calls SetDisplayPosition method.

	:param theXp:
	:type theXp: float
	:param theYp:
	:type theYp: float
	:param theZp:
	:type theZp: float
	:rtype: void
") SetPosition;
		virtual void SetPosition (const Standard_Real theXp,const Standard_Real theYp,const Standard_Real theZp);
		%feature("compactdefaultargs") SetSmoothAngle;
		%feature("autodoc", "	* Modifies the smoothing angle --in radians--

	:param theValue:
	:type theValue: float
	:rtype: None
") SetSmoothAngle;
		void SetSmoothAngle (const Standard_Real theValue);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the graphic structure of light source in the chosen view. We have three type of representation - SIMPLE : Only the light source is displayed. - PARTIAL : The light source and the light space are displayed. - COMPLETE : The same representation as PARTIAL. We can choose the 'SAMELAST' as parameter of representation In this case the graphic structure representation will be the last displayed.

	:param theView:
	:type theView: Handle_V3d_View &
	:param theRepresentation:
	:type theRepresentation: V3d_TypeOfRepresentation
	:rtype: None
") Display;
		void Display (const Handle_V3d_View & theView,const V3d_TypeOfRepresentation theRepresentation);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Calls DisplayPosition method.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:param theZ:
	:type theZ: float &
	:rtype: void
") Position;
		virtual void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") DisplayPosition;
		%feature("autodoc", "	* Returns the chosen position to represent the light source.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:param theZ:
	:type theZ: float &
	:rtype: None
") DisplayPosition;
		void DisplayPosition (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the theVx, theVy, theVz direction of the light source.

	:param theVx:
	:type theVx: float &
	:param theVy:
	:type theVy: float &
	:param theVz:
	:type theVz: float &
	:rtype: None
") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend V3d_DirectionalLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_DirectionalLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_DirectionalLight::Handle_V3d_DirectionalLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_DirectionalLight;
class Handle_V3d_DirectionalLight : public Handle_V3d_PositionLight {

    public:
        // constructors
        Handle_V3d_DirectionalLight();
        Handle_V3d_DirectionalLight(const Handle_V3d_DirectionalLight &aHandle);
        Handle_V3d_DirectionalLight(const V3d_DirectionalLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_DirectionalLight DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_DirectionalLight {
    V3d_DirectionalLight* _get_reference() {
    return (V3d_DirectionalLight*)$self->get();
    }
};

%extend Handle_V3d_DirectionalLight {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_DirectionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_PositionalLight;
class V3d_PositionalLight : public V3d_PositionLight {
	public:
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", "	* Creates an isolated light source theX, theY, theZ in the viewer. It is also defined by the color theColor and two attenuation factors theConstAttentuation, theLinearAttentuation. The resulting attenuation factor determining the illumination of a surface depends on the following formula : F = 1/--ConstAttenuation + LinearAttenuation*Length-- Length is the distance of the isolated source from the surface. Warning! raises BadValue from V3d if one of the attenuation coefficients is not in range [0, 1].

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color &
	:param theConstAttenuation: default value is 1.0
	:type theConstAttenuation: float
	:param theLinearAttenuation: default value is 0.0
	:type theLinearAttenuation: float
	:rtype: None
") V3d_PositionalLight;
		 V3d_PositionalLight (const Handle_V3d_Viewer & theViewer,const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theConstAttenuation = 1.0,const Standard_Real theLinearAttenuation = 0.0);
		%feature("compactdefaultargs") V3d_PositionalLight;
		%feature("autodoc", "	* Creates a light source of the Positional type in the viewer. theXt, theYt, theZt : Coordinate of Target light source. theXp, theYp, theZp : Coordinate of Position light source. The light source is also defined by the color Color and two attenuation factors theConstAttentuation, theLinearAttentuation that determine the illumination of a surface using the following formula : F = 1/--ConstAttenuation + LinearAttenuation*Length-- Length is the distance of the isolated source from the surface. Warning! raises BadValue from V3d if one of the attenuation coefficients is not between 0 et 1.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theXt:
	:type theXt: float
	:param theYt:
	:type theYt: float
	:param theZt:
	:type theZt: float
	:param theXp:
	:type theXp: float
	:param theYp:
	:type theYp: float
	:param theZp:
	:type theZp: float
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color &
	:param theConstAttenuation: default value is 1.0
	:type theConstAttenuation: float
	:param theLinearAttenuation: default value is 0.0
	:type theLinearAttenuation: float
	:rtype: None
") V3d_PositionalLight;
		 V3d_PositionalLight (const Handle_V3d_Viewer & theViewer,const Standard_Real theXt,const Standard_Real theYt,const Standard_Real theZt,const Standard_Real theXp,const Standard_Real theYp,const Standard_Real theZp,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theConstAttenuation = 1.0,const Standard_Real theLinearAttenuation = 0.0);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Defines the position of the light source.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: void
") SetPosition;
		virtual void SetPosition (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);
		%feature("compactdefaultargs") SetAttenuation;
		%feature("autodoc", "	* Defines the attenuation factors. Warning: raises BadValue from V3d if one of the attenuation coefficients is not between 0 et 1.

	:param theConstAttenuation:
	:type theConstAttenuation: float
	:param theLinearAttenuation:
	:type theLinearAttenuation: float
	:rtype: None
") SetAttenuation;
		void SetAttenuation (const Standard_Real theConstAttenuation,const Standard_Real theLinearAttenuation);
		%feature("compactdefaultargs") SetSmoothRadius;
		%feature("autodoc", "	* Modifies the smoothing radius

	:param theValue:
	:type theValue: float
	:rtype: None
") SetSmoothRadius;
		void SetSmoothRadius (const Standard_Real theValue);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the graphic structure of light source in the chosen view. We have three type of representation - SIMPLE : Only the light source is displayed. - PARTIAL : The light source and the light space are displayed. - COMPLETE : The light source, the light space and the radius of light space are displayed. We can choose the 'SAMELAST' as parameter of representation In this case the graphic structure representation will be the last displayed.

	:param theView:
	:type theView: Handle_V3d_View &
	:param theRepresentation:
	:type theRepresentation: V3d_TypeOfRepresentation
	:rtype: None
") Display;
		void Display (const Handle_V3d_View & theView,const V3d_TypeOfRepresentation theRepresentation);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position of the light source.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:param theZ:
	:type theZ: float &
	:rtype: None
") Position;
		void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "	* Returns the attenuation factors.

	:param theConstAttenuation:
	:type theConstAttenuation: float &
	:param theLinearAttenuation:
	:type theLinearAttenuation: float &
	:rtype: None
") Attenuation;
		void Attenuation (Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend V3d_PositionalLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_PositionalLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_PositionalLight::Handle_V3d_PositionalLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_PositionalLight;
class Handle_V3d_PositionalLight : public Handle_V3d_PositionLight {

    public:
        // constructors
        Handle_V3d_PositionalLight();
        Handle_V3d_PositionalLight(const Handle_V3d_PositionalLight &aHandle);
        Handle_V3d_PositionalLight(const V3d_PositionalLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_PositionalLight DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_PositionalLight {
    V3d_PositionalLight* _get_reference() {
    return (V3d_PositionalLight*)$self->get();
    }
};

%extend Handle_V3d_PositionalLight {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_PositionalLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor V3d_SpotLight;
class V3d_SpotLight : public V3d_PositionLight {
	public:
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "	* Creates a light source of the Spot type in the viewer. The attenuation factor F which determines the illumination of a surface depends on the following formula : F = 1/--theConstAttenuation + theLinearAttenuation*Length-- Length is the distance from the source to the surface. The default values --1.0,0.0-- correspond to a minimum of attenuation. The concentration factor determines the dispersion of the light on the surface, the default value --1.0-- corresponds to a minimum of dispersion. Warning! raises BadValue from V3d - If one of the coefficients is not between 0 and 1. If the lighting angle is <= 0 or > PI.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:param theDirection: default value is V3d_XnegYnegZpos
	:type theDirection: V3d_TypeOfOrientation
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color &
	:param theConstAttenuation: default value is 1.0
	:type theConstAttenuation: float
	:param theLinearAttenuation: default value is 0.0
	:type theLinearAttenuation: float
	:param theConcentration: default value is 1.0
	:type theConcentration: float
	:param theAngle: default value is 0.523599
	:type theAngle: float
	:rtype: None
") V3d_SpotLight;
		 V3d_SpotLight (const Handle_V3d_Viewer & theViewer,const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ,const V3d_TypeOfOrientation theDirection = V3d_XnegYnegZpos,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theConstAttenuation = 1.0,const Standard_Real theLinearAttenuation = 0.0,const Standard_Real theConcentration = 1.0,const Standard_Real theAngle = 0.523599);
		%feature("compactdefaultargs") V3d_SpotLight;
		%feature("autodoc", "	* Creates a light source of the Spot type in the viewer. theXt, theYt, theZt : Coordinate of light source Target. theXp, theYp, theZp : Coordinate of light source Position. The others parameters describe before. Warning! raises BadValue from V3d - If one of the coefficients is not between 0 and 1. If the lighting angle is <= 0 or > PI.

	:param theViewer:
	:type theViewer: Handle_V3d_Viewer &
	:param theXt:
	:type theXt: float
	:param theYt:
	:type theYt: float
	:param theZt:
	:type theZt: float
	:param theXp:
	:type theXp: float
	:param theYp:
	:type theYp: float
	:param theZp:
	:type theZp: float
	:param theColor: default value is Quantity_NOC_WHITE
	:type theColor: Quantity_Color &
	:param theConstAttenuation: default value is 1.0
	:type theConstAttenuation: float
	:param theLinearAttenuation: default value is 0.0
	:type theLinearAttenuation: float
	:param theConcentration: default value is 1.0
	:type theConcentration: float
	:param theAngle: default value is 0.523599
	:type theAngle: float
	:rtype: None
") V3d_SpotLight;
		 V3d_SpotLight (const Handle_V3d_Viewer & theViewer,const Standard_Real theXt,const Standard_Real theYt,const Standard_Real theZt,const Standard_Real theXp,const Standard_Real theYp,const Standard_Real theZp,const Quantity_Color & theColor = Quantity_NOC_WHITE,const Standard_Real theConstAttenuation = 1.0,const Standard_Real theLinearAttenuation = 0.0,const Standard_Real theConcentration = 1.0,const Standard_Real theAngle = 0.523599);
		%feature("compactdefaultargs") SetPosition;
		%feature("autodoc", "	* Defines the position of the light source.

	:param theX:
	:type theX: float
	:param theY:
	:type theY: float
	:param theZ:
	:type theZ: float
	:rtype: void
") SetPosition;
		virtual void SetPosition (const Standard_Real theX,const Standard_Real theY,const Standard_Real theZ);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Defines the direction of the light source. If the normal vector is NULL.

	:param theVx:
	:type theVx: float
	:param theVy:
	:type theVy: float
	:param theVz:
	:type theVz: float
	:rtype: None
") SetDirection;
		void SetDirection (const Standard_Real theVx,const Standard_Real theVy,const Standard_Real theVz);
		%feature("compactdefaultargs") SetDirection;
		%feature("autodoc", "	* Defines the direction of the light source according to a predefined directional vector.

	:param theOrientation:
	:type theOrientation: V3d_TypeOfOrientation
	:rtype: None
") SetDirection;
		void SetDirection (const V3d_TypeOfOrientation theOrientation);
		%feature("compactdefaultargs") SetAttenuation;
		%feature("autodoc", "	* Defines the coefficients of attenuation. Warning! raises BadValue from V3d if one of the coefficient is < 0 or > 1.

	:param theConstAttenuation:
	:type theConstAttenuation: float
	:param theLinearAttenuation:
	:type theLinearAttenuation: float
	:rtype: None
") SetAttenuation;
		void SetAttenuation (const Standard_Real theConstAttenuation,const Standard_Real theLinearAttenuation);
		%feature("compactdefaultargs") SetConcentration;
		%feature("autodoc", "	* Defines the coefficient of concentration. if the coefficient is < 0 or > 1.

	:param theConcentration:
	:type theConcentration: float
	:rtype: None
") SetConcentration;
		void SetConcentration (const Standard_Real theConcentration);
		%feature("compactdefaultargs") SetAngle;
		%feature("autodoc", "	* Defines the spot angle in RADIANS. Warning: raises BadValue from from V3d If the angle is <= 0 or > PI.

	:param theAngle:
	:type theAngle: float
	:rtype: None
") SetAngle;
		void SetAngle (const Standard_Real theAngle);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Display the graphic structure of light source in the chosen view. We have three type of representation - SIMPLE : Only the light source is displayed. - PARTIAL : The light source and the light space are displayed. - COMPLETE : The light source, the light space and the radius of light space are displayed. We can choose the 'SAMELAST' as parameter of representation In this case the graphic structure representation will be the last displayed.

	:param theView:
	:type theView: Handle_V3d_View &
	:param theRepresentation:
	:type theRepresentation: V3d_TypeOfRepresentation
	:rtype: None
") Display;
		void Display (const Handle_V3d_View & theView,const V3d_TypeOfRepresentation theRepresentation);
		%feature("compactdefaultargs") Direction;
		%feature("autodoc", "	* Returns the direction of the light source defined by theVx, theVy, theVz.

	:param theVx:
	:type theVx: float &
	:param theVy:
	:type theVy: float &
	:param theVz:
	:type theVz: float &
	:rtype: None
") Direction;
		void Direction (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "	* Returns the position of the light source.

	:param theX:
	:type theX: float &
	:param theY:
	:type theY: float &
	:param theZ:
	:type theZ: float &
	:rtype: None
") Position;
		void Position (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Attenuation;
		%feature("autodoc", "	* Returns the attenuation factors A1,A2 of the light source.

	:param theConstAttentuation:
	:type theConstAttentuation: float &
	:param theLinearAttentuation:
	:type theLinearAttentuation: float &
	:rtype: None
") Attenuation;
		void Attenuation (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Concentration;
		%feature("autodoc", "	:rtype: float
") Concentration;
		Standard_Real Concentration ();
		%feature("compactdefaultargs") Angle;
		%feature("autodoc", "	* Returns the spot angle.

	:rtype: float
") Angle;
		Standard_Real Angle ();
};


%extend V3d_SpotLight {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_V3d_SpotLight(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_V3d_SpotLight::Handle_V3d_SpotLight %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_V3d_SpotLight;
class Handle_V3d_SpotLight : public Handle_V3d_PositionLight {

    public:
        // constructors
        Handle_V3d_SpotLight();
        Handle_V3d_SpotLight(const Handle_V3d_SpotLight &aHandle);
        Handle_V3d_SpotLight(const V3d_SpotLight *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_V3d_SpotLight DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_V3d_SpotLight {
    V3d_SpotLight* _get_reference() {
    return (V3d_SpotLight*)$self->get();
    }
};

%extend Handle_V3d_SpotLight {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend V3d_SpotLight {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

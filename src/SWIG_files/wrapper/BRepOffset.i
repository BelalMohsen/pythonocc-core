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
%define BREPOFFSETDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BREPOFFSETDOCSTRING) BRepOffset

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


%include BRepOffset_headers.i


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
%template(BRepOffset_DataMapIteratorOfDataMapOfShapeListOfInterval) NCollection_TListIterator<BRepOffset_DataMapOfShapeListOfInterval>;
%template(BRepOffset_DataMapIteratorOfDataMapOfShapeMapOfShape) NCollection_TListIterator<BRepOffset_DataMapOfShapeMapOfShape>;
%template(BRepOffset_DataMapOfShapeOffset) NCollection_DataMap <TopoDS_Shape , BRepOffset_Offset , TopTools_ShapeMapHasher>;
%template(BRepOffset_ListIteratorOfListOfInterval) NCollection_TListIterator<BRepOffset_ListOfInterval>;
%template(BRepOffset_DataMapIteratorOfDataMapOfShapeOffset) NCollection_TListIterator<BRepOffset_DataMapOfShapeOffset>;
%template(BRepOffset_ListOfInterval) NCollection_List <BRepOffset_Interval>;
%template(BRepOffset_DataMapOfShapeListOfInterval) NCollection_DataMap <TopoDS_Shape , BRepOffset_ListOfInterval , TopTools_ShapeMapHasher>;
%template(BRepOffset_DataMapOfShapeMapOfShape) NCollection_DataMap <TopoDS_Shape , TopTools_MapOfShape , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* public enums */
enum BRepOffset_Error {
	BRepOffset_NoError = 0,
	BRepOffset_UnknownError = 1,
	BRepOffset_BadNormalsOnGeometry = 2,
	BRepOffset_C0Geometry = 3,
	BRepOffset_NullOffset = 4,
	BRepOffset_NotConnectedShell = 5,
};

enum BRepOffsetSimple_Status {
	BRepOffsetSimple_OK = 0,
	BRepOffsetSimple_NullInputShape = 1,
	BRepOffsetSimple_ErrorOffsetComputation = 2,
	BRepOffsetSimple_ErrorWallFaceComputation = 3,
	BRepOffsetSimple_ErrorInvalidNbShells = 4,
	BRepOffsetSimple_ErrorNonClosedShell = 5,
};

enum BRepOffset_Mode {
	BRepOffset_Skin = 0,
	BRepOffset_Pipe = 1,
	BRepOffset_RectoVerso = 2,
};

enum BRepOffset_Type {
	BRepOffset_Concave = 0,
	BRepOffset_Convex = 1,
	BRepOffset_Tangent = 2,
	BRepOffset_FreeBoundary = 3,
	BRepOffset_Other = 4,
};

enum BRepOffset_Status {
	BRepOffset_Good = 0,
	BRepOffset_Reversed = 1,
	BRepOffset_Degenerated = 2,
	BRepOffset_Unknown = 3,
};

/* end public enums declaration */

%rename(brepoffset) BRepOffset;
%nodefaultctor BRepOffset;
class BRepOffset {
	public:
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "	* returns the Offset surface computed from the surface <Surface> at an OffsetDistance <Offset>. //! If possible, this method returns the real type of the surface -- e.g. An Offset of a plane is a plane--. //! If no particular case is detected, the returned surface will have the Type Geom_OffsetSurface. Parameter allowC0 is then passed as last argument to constructor of Geom_OffsetSurface.

	:param Surface:
	:type Surface: Handle_Geom_Surface &
	:param Offset:
	:type Offset: float
	:param theStatus:
	:type theStatus: BRepOffset_Status &
	:param allowC0: default value is Standard_False
	:type allowC0: bool
	:rtype: Handle_Geom_Surface
") Surface;
		static Handle_Geom_Surface Surface (const Handle_Geom_Surface & Surface,const Standard_Real Offset,BRepOffset_Status & theStatus,Standard_Boolean allowC0 = Standard_False);
		%feature("compactdefaultargs") CollapseSingularities;
		%feature("autodoc", "	* Preprocess surface to be offset --bspline, bezier, or revolution based on bspline or bezier curve--, by collapsing each singular side to single point. //! This is to avoid possible flipping of normal at the singularity of the surface due to non-zero distance between the poles that logically should be in one point --singularity--. The --parametric-- side of the surface is considered to be singularity if face has degenerated edge whose vertex encompasses --by its tolerance-- all points on that side, or if all poles defining that side fit into sphere with radius thePrecision. //! Returns either original surface or its modified copy --if some poles have been moved--.

	:param theSurface:
	:type theSurface: Handle_Geom_Surface &
	:param theFace:
	:type theFace: TopoDS_Face &
	:param thePrecision:
	:type thePrecision: float
	:rtype: Handle_Geom_Surface
") CollapseSingularities;
		static Handle_Geom_Surface CollapseSingularities (const Handle_Geom_Surface & theSurface,const TopoDS_Face & theFace,Standard_Real thePrecision);
};


%extend BRepOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_Analyse;
class BRepOffset_Analyse {
	public:
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "	:rtype: None
") BRepOffset_Analyse;
		 BRepOffset_Analyse ();
		%feature("compactdefaultargs") BRepOffset_Analyse;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Angle:
	:type Angle: float
	:rtype: None
") BRepOffset_Analyse;
		 BRepOffset_Analyse (const TopoDS_Shape & S,const Standard_Real Angle);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Angle:
	:type Angle: float
	:rtype: None
") Perform;
		void Perform (const TopoDS_Shape & S,const Standard_Real Angle);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param E:
	:type E: TopoDS_Edge &
	:rtype: BRepOffset_ListOfInterval
") Type;
		const BRepOffset_ListOfInterval & Type (const TopoDS_Edge & E);
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "	* Stores in <L> all the edges of Type <T> on the vertex <V>.

	:param V:
	:type V: TopoDS_Vertex &
	:param T:
	:type T: BRepOffset_Type
	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Edges;
		void Edges (const TopoDS_Vertex & V,const BRepOffset_Type T,TopTools_ListOfShape & L);
		%feature("compactdefaultargs") Edges;
		%feature("autodoc", "	* Stores in <L> all the edges of Type <T> on the face <F>.

	:param F:
	:type F: TopoDS_Face &
	:param T:
	:type T: BRepOffset_Type
	:param L:
	:type L: TopTools_ListOfShape &
	:rtype: None
") Edges;
		void Edges (const TopoDS_Face & F,const BRepOffset_Type T,TopTools_ListOfShape & L);
		%feature("compactdefaultargs") TangentEdges;
		%feature("autodoc", "	* set in <Edges> all the Edges of <Shape> which are tangent to <Edge> at the vertex <Vertex>.

	:param Edge:
	:type Edge: TopoDS_Edge &
	:param Vertex:
	:type Vertex: TopoDS_Vertex &
	:param Edges:
	:type Edges: TopTools_ListOfShape &
	:rtype: None
") TangentEdges;
		void TangentEdges (const TopoDS_Edge & Edge,const TopoDS_Vertex & Vertex,TopTools_ListOfShape & Edges);
		%feature("compactdefaultargs") HasAncestor;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: bool
") HasAncestor;
		Standard_Boolean HasAncestor (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Ancestors;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopTools_ListOfShape
") Ancestors;
		const TopTools_ListOfShape & Ancestors (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Explode;
		%feature("autodoc", "	* Explode in compounds of faces where all the connex edges are of type <Side>

	:param L:
	:type L: TopTools_ListOfShape &
	:param Type:
	:type Type: BRepOffset_Type
	:rtype: None
") Explode;
		void Explode (TopTools_ListOfShape & L,const BRepOffset_Type Type);
		%feature("compactdefaultargs") Explode;
		%feature("autodoc", "	* Explode in compounds of faces where all the connex edges are of type <Side1> or <Side2>

	:param L:
	:type L: TopTools_ListOfShape &
	:param Type1:
	:type Type1: BRepOffset_Type
	:param Type2:
	:type Type2: BRepOffset_Type
	:rtype: None
") Explode;
		void Explode (TopTools_ListOfShape & L,const BRepOffset_Type Type1,const BRepOffset_Type Type2);
		%feature("compactdefaultargs") AddFaces;
		%feature("autodoc", "	* Add in <CO> the faces of the shell containing <Face> where all the connex edges are of type <Side>.

	:param Face:
	:type Face: TopoDS_Face &
	:param Co:
	:type Co: TopoDS_Compound &
	:param Map:
	:type Map: TopTools_MapOfShape &
	:param Type:
	:type Type: BRepOffset_Type
	:rtype: None
") AddFaces;
		void AddFaces (const TopoDS_Face & Face,TopoDS_Compound & Co,TopTools_MapOfShape & Map,const BRepOffset_Type Type);
		%feature("compactdefaultargs") AddFaces;
		%feature("autodoc", "	* Add in <CO> the faces of the shell containing <Face> where all the connex edges are of type <Side1> or <Side2>.

	:param Face:
	:type Face: TopoDS_Face &
	:param Co:
	:type Co: TopoDS_Compound &
	:param Map:
	:type Map: TopTools_MapOfShape &
	:param Type1:
	:type Type1: BRepOffset_Type
	:param Type2:
	:type Type2: BRepOffset_Type
	:rtype: None
") AddFaces;
		void AddFaces (const TopoDS_Face & Face,TopoDS_Compound & Co,TopTools_MapOfShape & Map,const BRepOffset_Type Type1,const BRepOffset_Type Type2);
};


%extend BRepOffset_Analyse {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BRepOffset_Inter2d {
	public:
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the intersections between the edges stored is AsDes as descendants of <F> . Intersections is computed between two edges if one of them is bound in NewEdges. When all faces of the shape are treated the intersection vertices have to be fused using the FuseVertices method. theDMVV contains the vertices that should be fused

	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param F:
	:type F: TopoDS_Face &
	:param NewEdges:
	:type NewEdges: TopTools_IndexedMapOfShape &
	:param Tol:
	:type Tol: float
	:param theDMVV:
	:type theDMVV: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: void
") Compute;
		static void Compute (const Handle_BRepAlgo_AsDes & AsDes,const TopoDS_Face & F,const TopTools_IndexedMapOfShape & NewEdges,const Standard_Real Tol,TopTools_IndexedDataMapOfShapeListOfShape & theDMVV);
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "	* Computes the intersection between the offset edges of the <FI>. All intersection vertices will be stored in AsDes2d. When all faces of the shape are treated the intersection vertices have to be fused using the FuseVertices method. theDMVV contains the vertices that should be fused.

	:param FI:
	:type FI: TopoDS_Face &
	:param OFI:
	:type OFI: BRepOffset_Offset &
	:param MES:
	:type MES: TopTools_DataMapOfShapeShape &
	:param Build:
	:type Build: TopTools_DataMapOfShapeShape &
	:param AsDes2d:
	:type AsDes2d: Handle_BRepAlgo_AsDes &
	:param Offset:
	:type Offset: float
	:param Tol:
	:type Tol: float
	:param FacesWithVerts:
	:type FacesWithVerts: TopTools_IndexedMapOfShape &
	:param theDMVV:
	:type theDMVV: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: void
") ConnexIntByInt;
		static void ConnexIntByInt (const TopoDS_Face & FI,BRepOffset_Offset & OFI,TopTools_DataMapOfShapeShape & MES,const TopTools_DataMapOfShapeShape & Build,const Handle_BRepAlgo_AsDes & AsDes2d,const Standard_Real Offset,const Standard_Real Tol,TopTools_IndexedMapOfShape & FacesWithVerts,TopTools_IndexedDataMapOfShapeListOfShape & theDMVV);
		%feature("compactdefaultargs") ConnexIntByIntInVert;
		%feature("autodoc", "	* Computes the intersection between the offset edges generated from vertices and stored into AsDes as descendants of the <FI>. All intersection vertices will be stored in AsDes2d. When all faces of the shape are treated the intersection vertices have to be fused using the FuseVertices method. theDMVV contains the vertices that should be fused.

	:param FI:
	:type FI: TopoDS_Face &
	:param OFI:
	:type OFI: BRepOffset_Offset &
	:param MES:
	:type MES: TopTools_DataMapOfShapeShape &
	:param Build:
	:type Build: TopTools_DataMapOfShapeShape &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param AsDes2d:
	:type AsDes2d: Handle_BRepAlgo_AsDes &
	:param Tol:
	:type Tol: float
	:param theDMVV:
	:type theDMVV: TopTools_IndexedDataMapOfShapeListOfShape &
	:rtype: void
") ConnexIntByIntInVert;
		static void ConnexIntByIntInVert (const TopoDS_Face & FI,BRepOffset_Offset & OFI,TopTools_DataMapOfShapeShape & MES,const TopTools_DataMapOfShapeShape & Build,const Handle_BRepAlgo_AsDes & AsDes,const Handle_BRepAlgo_AsDes & AsDes2d,const Standard_Real Tol,TopTools_IndexedDataMapOfShapeListOfShape & theDMVV);
		%feature("compactdefaultargs") FuseVertices;
		%feature("autodoc", "	* Fuses the chains of vertices in the theDMVV and updates AsDes by replacing the old vertices with the new ones.

	:param theDMVV:
	:type theDMVV: TopTools_IndexedDataMapOfShapeListOfShape &
	:param theAsDes:
	:type theAsDes: Handle_BRepAlgo_AsDes &
	:rtype: void
") FuseVertices;
		static void FuseVertices (const TopTools_IndexedDataMapOfShapeListOfShape & theDMVV,const Handle_BRepAlgo_AsDes & theAsDes);
		%feature("compactdefaultargs") ExtentEdge;
		%feature("autodoc", "	* extents the edge

	:param E:
	:type E: TopoDS_Edge &
	:param NE:
	:type NE: TopoDS_Edge &
	:param theOffset:
	:type theOffset: float
	:rtype: void
") ExtentEdge;
		static void ExtentEdge (const TopoDS_Edge & E,TopoDS_Edge & NE,const Standard_Real theOffset);
};


%extend BRepOffset_Inter2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_Inter3d;
class BRepOffset_Inter3d {
	public:
		%feature("compactdefaultargs") BRepOffset_Inter3d;
		%feature("autodoc", "	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Side:
	:type Side: TopAbs_State
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepOffset_Inter3d;
		 BRepOffset_Inter3d (const Handle_BRepAlgo_AsDes & AsDes,const TopAbs_State Side,const Standard_Real Tol);
		%feature("compactdefaultargs") CompletInt;
		%feature("autodoc", "	:param SetOfFaces:
	:type SetOfFaces: TopTools_ListOfShape &
	:param InitOffsetFace:
	:type InitOffsetFace: BRepAlgo_Image &
	:rtype: None
") CompletInt;
		void CompletInt (const TopTools_ListOfShape & SetOfFaces,const BRepAlgo_Image & InitOffsetFace);
		%feature("compactdefaultargs") FaceInter;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param InitOffsetFace:
	:type InitOffsetFace: BRepAlgo_Image &
	:rtype: None
") FaceInter;
		void FaceInter (const TopoDS_Face & F1,const TopoDS_Face & F2,const BRepAlgo_Image & InitOffsetFace);
		%feature("compactdefaultargs") ConnexIntByArc;
		%feature("autodoc", "	:param SetOfFaces:
	:type SetOfFaces: TopTools_ListOfShape &
	:param ShapeInit:
	:type ShapeInit: TopoDS_Shape &
	:param Analyse:
	:type Analyse: BRepOffset_Analyse &
	:param InitOffsetFace:
	:type InitOffsetFace: BRepAlgo_Image &
	:rtype: None
") ConnexIntByArc;
		void ConnexIntByArc (const TopTools_ListOfShape & SetOfFaces,const TopoDS_Shape & ShapeInit,const BRepOffset_Analyse & Analyse,const BRepAlgo_Image & InitOffsetFace);
		%feature("compactdefaultargs") ConnexIntByInt;
		%feature("autodoc", "	:param SI:
	:type SI: TopoDS_Shape &
	:param MapSF:
	:type MapSF: BRepOffset_DataMapOfShapeOffset &
	:param A:
	:type A: BRepOffset_Analyse &
	:param MES:
	:type MES: TopTools_DataMapOfShapeShape &
	:param Build:
	:type Build: TopTools_DataMapOfShapeShape &
	:param Failed:
	:type Failed: TopTools_ListOfShape &
	:param bIsPlanar: default value is Standard_False
	:type bIsPlanar: bool
	:rtype: None
") ConnexIntByInt;
		void ConnexIntByInt (const TopoDS_Shape & SI,const BRepOffset_DataMapOfShapeOffset & MapSF,const BRepOffset_Analyse & A,TopTools_DataMapOfShapeShape & MES,TopTools_DataMapOfShapeShape & Build,TopTools_ListOfShape & Failed,const Standard_Boolean bIsPlanar = Standard_False);
		%feature("compactdefaultargs") ContextIntByInt;
		%feature("autodoc", "	:param ContextFaces:
	:type ContextFaces: TopTools_IndexedMapOfShape &
	:param ExtentContext:
	:type ExtentContext: bool
	:param MapSF:
	:type MapSF: BRepOffset_DataMapOfShapeOffset &
	:param A:
	:type A: BRepOffset_Analyse &
	:param MES:
	:type MES: TopTools_DataMapOfShapeShape &
	:param Build:
	:type Build: TopTools_DataMapOfShapeShape &
	:param Failed:
	:type Failed: TopTools_ListOfShape &
	:param bIsPlanar: default value is Standard_False
	:type bIsPlanar: bool
	:rtype: None
") ContextIntByInt;
		void ContextIntByInt (const TopTools_IndexedMapOfShape & ContextFaces,const Standard_Boolean ExtentContext,const BRepOffset_DataMapOfShapeOffset & MapSF,const BRepOffset_Analyse & A,TopTools_DataMapOfShapeShape & MES,TopTools_DataMapOfShapeShape & Build,TopTools_ListOfShape & Failed,const Standard_Boolean bIsPlanar = Standard_False);
		%feature("compactdefaultargs") ContextIntByArc;
		%feature("autodoc", "	:param ContextFaces:
	:type ContextFaces: TopTools_IndexedMapOfShape &
	:param ExtentContext:
	:type ExtentContext: bool
	:param Analyse:
	:type Analyse: BRepOffset_Analyse &
	:param InitOffsetFace:
	:type InitOffsetFace: BRepAlgo_Image &
	:param InitOffsetEdge:
	:type InitOffsetEdge: BRepAlgo_Image &
	:rtype: None
") ContextIntByArc;
		void ContextIntByArc (const TopTools_IndexedMapOfShape & ContextFaces,const Standard_Boolean ExtentContext,const BRepOffset_Analyse & Analyse,const BRepAlgo_Image & InitOffsetFace,BRepAlgo_Image & InitOffsetEdge);
		%feature("compactdefaultargs") AddCommonEdges;
		%feature("autodoc", "	:param SetOfFaces:
	:type SetOfFaces: TopTools_ListOfShape &
	:rtype: None
") AddCommonEdges;
		void AddCommonEdges (const TopTools_ListOfShape & SetOfFaces);
		%feature("compactdefaultargs") SetDone;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: None
") SetDone;
		void SetDone (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:rtype: bool
") IsDone;
		Standard_Boolean IsDone (const TopoDS_Face & F1,const TopoDS_Face & F2);
		%feature("compactdefaultargs") TouchedFaces;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") TouchedFaces;
		TopTools_IndexedMapOfShape & TouchedFaces ();
		%feature("compactdefaultargs") AsDes;
		%feature("autodoc", "	:rtype: Handle_BRepAlgo_AsDes
") AsDes;
		Handle_BRepAlgo_AsDes AsDes ();
		%feature("compactdefaultargs") NewEdges;
		%feature("autodoc", "	:rtype: TopTools_IndexedMapOfShape
") NewEdges;
		TopTools_IndexedMapOfShape & NewEdges ();
};


%extend BRepOffset_Inter3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_Interval;
class BRepOffset_Interval {
	public:
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "	:rtype: None
") BRepOffset_Interval;
		 BRepOffset_Interval ();
		%feature("compactdefaultargs") BRepOffset_Interval;
		%feature("autodoc", "	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param Type:
	:type Type: BRepOffset_Type
	:rtype: None
") BRepOffset_Interval;
		 BRepOffset_Interval (const Standard_Real U1,const Standard_Real U2,const BRepOffset_Type Type);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: None
") First;
		void First (const Standard_Real U);
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: None
") Last;
		void Last (const Standard_Real U);
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:param T:
	:type T: BRepOffset_Type
	:rtype: None
") Type;
		void Type (const BRepOffset_Type T);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: float
") First;
		Standard_Real First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: float
") Last;
		Standard_Real Last ();
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "	:rtype: BRepOffset_Type
") Type;
		BRepOffset_Type Type ();
};


%extend BRepOffset_Interval {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_MakeLoops;
class BRepOffset_MakeLoops {
	public:
		%feature("compactdefaultargs") BRepOffset_MakeLoops;
		%feature("autodoc", "	:rtype: None
") BRepOffset_MakeLoops;
		 BRepOffset_MakeLoops ();
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	:param LF:
	:type LF: TopTools_ListOfShape &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Image:
	:type Image: BRepAlgo_Image &
	:rtype: None
") Build;
		void Build (const TopTools_ListOfShape & LF,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image);
		%feature("compactdefaultargs") BuildOnContext;
		%feature("autodoc", "	:param LContext:
	:type LContext: TopTools_ListOfShape &
	:param Analyse:
	:type Analyse: BRepOffset_Analyse &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Image:
	:type Image: BRepAlgo_Image &
	:param InSide:
	:type InSide: bool
	:rtype: None
") BuildOnContext;
		void BuildOnContext (const TopTools_ListOfShape & LContext,const BRepOffset_Analyse & Analyse,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image,const Standard_Boolean InSide);
		%feature("compactdefaultargs") BuildFaces;
		%feature("autodoc", "	:param LF:
	:type LF: TopTools_ListOfShape &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param Image:
	:type Image: BRepAlgo_Image &
	:rtype: None
") BuildFaces;
		void BuildFaces (const TopTools_ListOfShape & LF,const Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & Image);
};


%extend BRepOffset_MakeLoops {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_MakeOffset;
class BRepOffset_MakeOffset {
	public:
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "	:rtype: None
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset ();
		%feature("compactdefaultargs") BRepOffset_MakeOffset;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Offset:
	:type Offset: float
	:param Tol:
	:type Tol: float
	:param Mode: default value is BRepOffset_Skin
	:type Mode: BRepOffset_Mode
	:param Intersection: default value is Standard_False
	:type Intersection: bool
	:param SelfInter: default value is Standard_False
	:type SelfInter: bool
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Thickening: default value is Standard_False
	:type Thickening: bool
	:param RemoveIntEdges: default value is Standard_False
	:type RemoveIntEdges: bool
	:rtype: None
") BRepOffset_MakeOffset;
		 BRepOffset_MakeOffset (const TopoDS_Shape & S,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Thickening = Standard_False,const Standard_Boolean RemoveIntEdges = Standard_False);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param Offset:
	:type Offset: float
	:param Tol:
	:type Tol: float
	:param Mode: default value is BRepOffset_Skin
	:type Mode: BRepOffset_Mode
	:param Intersection: default value is Standard_False
	:type Intersection: bool
	:param SelfInter: default value is Standard_False
	:type SelfInter: bool
	:param Join: default value is GeomAbs_Arc
	:type Join: GeomAbs_JoinType
	:param Thickening: default value is Standard_False
	:type Thickening: bool
	:param RemoveIntEdges: default value is Standard_False
	:type RemoveIntEdges: bool
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Shape & S,const Standard_Real Offset,const Standard_Real Tol,const BRepOffset_Mode Mode = BRepOffset_Skin,const Standard_Boolean Intersection = Standard_False,const Standard_Boolean SelfInter = Standard_False,const GeomAbs_JoinType Join = GeomAbs_Arc,const Standard_Boolean Thickening = Standard_False,const Standard_Boolean RemoveIntEdges = Standard_False);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") AddFace;
		%feature("autodoc", "	* Add Closing Faces, <F> has to be in the initial shape S.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") AddFace;
		void AddFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") SetOffsetOnFace;
		%feature("autodoc", "	* set the offset <Off> on the Face <F>

	:param F:
	:type F: TopoDS_Face &
	:param Off:
	:type Off: float
	:rtype: None
") SetOffsetOnFace;
		void SetOffsetOnFace (const TopoDS_Face & F,const Standard_Real Off);
		%feature("compactdefaultargs") MakeOffsetShape;
		%feature("autodoc", "	:rtype: None
") MakeOffsetShape;
		void MakeOffsetShape ();
		%feature("compactdefaultargs") MakeThickSolid;
		%feature("autodoc", "	:rtype: None
") MakeThickSolid;
		void MakeThickSolid ();
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		const TopoDS_Shape  Shape ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	* returns information about offset state.

	:rtype: BRepOffset_Error
") Error;
		BRepOffset_Error Error ();
		%feature("compactdefaultargs") OffsetFacesFromShapes;
		%feature("autodoc", "	* Returns <Image> containing links between initials shapes and offset faces.

	:rtype: BRepAlgo_Image
") OffsetFacesFromShapes;
		const BRepAlgo_Image & OffsetFacesFromShapes ();
		%feature("compactdefaultargs") GetJoinType;
		%feature("autodoc", "	* Returns myJoin.

	:rtype: GeomAbs_JoinType
") GetJoinType;
		GeomAbs_JoinType GetJoinType ();
		%feature("compactdefaultargs") OffsetEdgesFromShapes;
		%feature("autodoc", "	* Returns <Image> containing links between initials shapes and offset edges.

	:rtype: BRepAlgo_Image
") OffsetEdgesFromShapes;
		const BRepAlgo_Image & OffsetEdgesFromShapes ();
		%feature("compactdefaultargs") ClosingFaces;
		%feature("autodoc", "	* Returns the list of closing faces stores by AddFace

	:rtype: TopTools_IndexedMapOfShape
") ClosingFaces;
		const TopTools_IndexedMapOfShape & ClosingFaces ();
		%feature("compactdefaultargs") CheckInputData;
		%feature("autodoc", "	* Makes pre analysis of possibility offset perform. Use method Error---- to get more information. Finds first error. List of checks: 1-- Check for existence object with non-null offset. 2-- Check for connectivity in offset shell. 3-- Check continuity of input surfaces. 4-- Check for normals existence on grid. returns True if possible make computations and false otherwise.

	:rtype: bool
") CheckInputData;
		Standard_Boolean CheckInputData ();
		%feature("compactdefaultargs") GetBadShape;
		%feature("autodoc", "	* Return bad shape, which obtained in CheckInputData.

	:rtype: TopoDS_Shape
") GetBadShape;
		const TopoDS_Shape  GetBadShape ();
};


%extend BRepOffset_MakeOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_MakeSimpleOffset;
class BRepOffset_MakeSimpleOffset {
	public:
		%feature("compactdefaultargs") BRepOffset_MakeSimpleOffset;
		%feature("autodoc", "	* Constructor. Does nothing.

	:rtype: None
") BRepOffset_MakeSimpleOffset;
		 BRepOffset_MakeSimpleOffset ();
		%feature("compactdefaultargs") BRepOffset_MakeSimpleOffset;
		%feature("autodoc", "	* Constructor.

	:param theInputShape:
	:type theInputShape: TopoDS_Shape &
	:param theOffsetValue:
	:type theOffsetValue: float
	:rtype: None
") BRepOffset_MakeSimpleOffset;
		 BRepOffset_MakeSimpleOffset (const TopoDS_Shape & theInputShape,const Standard_Real theOffsetValue);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	* Initialies shape for modifications.

	:param theInputShape:
	:type theInputShape: TopoDS_Shape &
	:param theOffsetValue:
	:type theOffsetValue: float
	:rtype: None
") Initialize;
		void Initialize (const TopoDS_Shape & theInputShape,const Standard_Real theOffsetValue);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes offset shape.

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") GetErrorMessage;
		%feature("autodoc", "	* Gets error message.

	:rtype: TCollection_AsciiString
") GetErrorMessage;
		TCollection_AsciiString GetErrorMessage ();
		%feature("compactdefaultargs") GetError;
		%feature("autodoc", "	* Gets error code.

	:rtype: BRepOffsetSimple_Status
") GetError;
		BRepOffsetSimple_Status GetError ();
		%feature("compactdefaultargs") GetBuildSolidFlag;
		%feature("autodoc", "	* Gets solid building flag.

	:rtype: bool
") GetBuildSolidFlag;
		Standard_Boolean GetBuildSolidFlag ();
		%feature("compactdefaultargs") SetBuildSolidFlag;
		%feature("autodoc", "	* Sets solid building flag.

	:param theBuildFlag:
	:type theBuildFlag: bool
	:rtype: None
") SetBuildSolidFlag;
		void SetBuildSolidFlag (const Standard_Boolean theBuildFlag);
		%feature("compactdefaultargs") GetOffsetValue;
		%feature("autodoc", "	* Gets offset value.

	:rtype: float
") GetOffsetValue;
		Standard_Real GetOffsetValue ();
		%feature("compactdefaultargs") SetOffsetValue;
		%feature("autodoc", "	* Sets offset value.

	:param theOffsetValue:
	:type theOffsetValue: float
	:rtype: None
") SetOffsetValue;
		void SetOffsetValue (const Standard_Real theOffsetValue);
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "	* Gets tolerance --used for handling singularities--.

	:rtype: float
") GetTolerance;
		Standard_Real GetTolerance ();
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets tolerance --used for handling singularities--.

	:param theValue:
	:type theValue: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real theValue);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* Gets done state.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") GetResultShape;
		%feature("autodoc", "	* Returns result shape.

	:rtype: TopoDS_Shape
") GetResultShape;
		const TopoDS_Shape  GetResultShape ();
		%feature("compactdefaultargs") GetSafeOffset;
		%feature("autodoc", "	* Computes max safe offset value for the given tolerance.

	:param theExpectedToler:
	:type theExpectedToler: float
	:rtype: float
") GetSafeOffset;
		Standard_Real GetSafeOffset (const Standard_Real theExpectedToler);
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	* Returnes result shape for the given one --if exists--.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Generated;
		const TopoDS_Shape Generated (const TopoDS_Shape & theShape);
		%feature("compactdefaultargs") Modified;
		%feature("autodoc", "	* Returnes modified shape for the given one --if exists--.

	:param theShape:
	:type theShape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Modified;
		const TopoDS_Shape Modified (const TopoDS_Shape & theShape);
};


%extend BRepOffset_MakeSimpleOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_Offset;
class BRepOffset_Offset {
	public:
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset ();
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	:param Face:
	:type Face: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param OffsetOutside: default value is Standard_True
	:type OffsetOutside: bool
	:param JoinType: default value is GeomAbs_Arc
	:type JoinType: GeomAbs_JoinType
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Face & Face,const Standard_Real Offset,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	* This method will be called when you want to share the edges soon generated from an other face. e.g. when two faces are tangents the common edge will generate only one edge -- no pipe--. //! The Map will be fill as follow: //! Created--E-- = E' with: E = an edge of <Face> E' = the image of E in the offseting of another face sharing E with a continuity at least G1

	:param Face:
	:type Face: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param Created:
	:type Created: TopTools_DataMapOfShapeShape &
	:param OffsetOutside: default value is Standard_True
	:type OffsetOutside: bool
	:param JoinType: default value is GeomAbs_Arc
	:type JoinType: GeomAbs_JoinType
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Face & Face,const Standard_Real Offset,const TopTools_DataMapOfShapeShape & Created,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Edge &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Edge &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:param FirstEdge:
	:type FirstEdge: TopoDS_Edge &
	:param LastEdge:
	:type LastEdge: TopoDS_Edge &
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & LastEdge,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") BRepOffset_Offset;
		%feature("autodoc", "	* Tol and Conti are only used if Polynomial is True --Used to perfrom the approximation--

	:param Vertex:
	:type Vertex: TopoDS_Vertex &
	:param LEdge:
	:type LEdge: TopTools_ListOfShape &
	:param Offset:
	:type Offset: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") BRepOffset_Offset;
		 BRepOffset_Offset (const TopoDS_Vertex & Vertex,const TopTools_ListOfShape & LEdge,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Face:
	:type Face: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param OffsetOutside: default value is Standard_True
	:type OffsetOutside: bool
	:param JoinType: default value is GeomAbs_Arc
	:type JoinType: GeomAbs_JoinType
	:rtype: None
") Init;
		void Init (const TopoDS_Face & Face,const Standard_Real Offset,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Face:
	:type Face: TopoDS_Face &
	:param Offset:
	:type Offset: float
	:param Created:
	:type Created: TopTools_DataMapOfShapeShape &
	:param OffsetOutside: default value is Standard_True
	:type OffsetOutside: bool
	:param JoinType: default value is GeomAbs_Arc
	:type JoinType: GeomAbs_JoinType
	:rtype: None
") Init;
		void Init (const TopoDS_Face & Face,const Standard_Real Offset,const TopTools_DataMapOfShapeShape & Created,const Standard_Boolean OffsetOutside = Standard_True,const GeomAbs_JoinType JoinType = GeomAbs_Arc);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Edge &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param Path:
	:type Path: TopoDS_Edge &
	:param Edge1:
	:type Edge1: TopoDS_Edge &
	:param Edge2:
	:type Edge2: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:param FirstEdge:
	:type FirstEdge: TopoDS_Edge &
	:param LastEdge:
	:type LastEdge: TopoDS_Edge &
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & Path,const TopoDS_Edge & Edge1,const TopoDS_Edge & Edge2,const Standard_Real Offset,const TopoDS_Edge & FirstEdge,const TopoDS_Edge & LastEdge,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Tol and Conti are only used if Polynomial is True --Used to perfrom the approximation--

	:param Vertex:
	:type Vertex: TopoDS_Vertex &
	:param LEdge:
	:type LEdge: TopTools_ListOfShape &
	:param Offset:
	:type Offset: float
	:param Polynomial: default value is Standard_False
	:type Polynomial: bool
	:param Tol: default value is 1.0e-4
	:type Tol: float
	:param Conti: default value is GeomAbs_C1
	:type Conti: GeomAbs_Shape
	:rtype: None
") Init;
		void Init (const TopoDS_Vertex & Vertex,const TopTools_ListOfShape & LEdge,const Standard_Real Offset,const Standard_Boolean Polynomial = Standard_False,const Standard_Real Tol = 1.0e-4,const GeomAbs_Shape Conti = GeomAbs_C1);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Only used in Rolling Ball. Pipe on Free Boundary

	:param Edge:
	:type Edge: TopoDS_Edge &
	:param Offset:
	:type Offset: float
	:rtype: None
") Init;
		void Init (const TopoDS_Edge & Edge,const Standard_Real Offset);
		%feature("compactdefaultargs") InitialShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") InitialShape;
		const TopoDS_Shape  InitialShape ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
		%feature("compactdefaultargs") Generated;
		%feature("autodoc", "	:param Shape:
	:type Shape: TopoDS_Shape &
	:rtype: TopoDS_Shape
") Generated;
		TopoDS_Shape Generated (const TopoDS_Shape & Shape);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	:rtype: BRepOffset_Status
") Status;
		BRepOffset_Status Status ();
};


%extend BRepOffset_Offset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepOffset_SimpleOffset;
class BRepOffset_SimpleOffset : public BRepTools_Modification {
	public:
		%feature("compactdefaultargs") BRepOffset_SimpleOffset;
		%feature("autodoc", "	* Constructor. @param theInputShape shape to be offset @param theOffsetValue offset distance --signed-- @param theTolerance tolerance for handling singular points

	:param theInputShape:
	:type theInputShape: TopoDS_Shape &
	:param theOffsetValue:
	:type theOffsetValue: float
	:param theTolerance:
	:type theTolerance: float
	:rtype: None
") BRepOffset_SimpleOffset;
		 BRepOffset_SimpleOffset (const TopoDS_Shape & theInputShape,const Standard_Real theOffsetValue,const Standard_Real theTolerance);
		%feature("compactdefaultargs") NewSurface;
		%feature("autodoc", "	* Returns Standard_True if the face <F> has been modified. In this case, <S> is the new geometric support of the face, <L> the new location,<Tol> the new tolerance.<RevWires> has to be set to Standard_True when the modification reverses the normal of the surface.--the wires have to be reversed--. <RevFace> has to be set to Standard_True if the orientation of the modified face changes in the shells which contain it. -- Here, <RevFace> will return Standard_True if the -- gp_Trsf is negative.

	:param F:
	:type F: TopoDS_Face &
	:param S:
	:type S: Handle_Geom_Surface &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:param RevWires:
	:type RevWires: bool
	:param RevFace:
	:type RevFace: bool
	:rtype: bool
") NewSurface;
		Standard_Boolean NewSurface (const TopoDS_Face & F,Handle_Geom_Surface & S,TopLoc_Location & L,Standard_Real &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") NewCurve;
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has been modified. In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param C:
	:type C: Handle_Geom_Curve &
	:param L:
	:type L: TopLoc_Location &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve;
		Standard_Boolean NewCurve (const TopoDS_Edge & E,Handle_Geom_Curve & C,TopLoc_Location & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewPoint;
		%feature("autodoc", "	* Returns Standard_True if the vertex <V> has been modified. In this case, <P> is the new geometric support of the vertex, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewPoint;
		Standard_Boolean NewPoint (const TopoDS_Vertex & V,gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewCurve2d;
		%feature("autodoc", "	* Returns Standard_True if the edge <E> has a new curve on surface on the face <F>.In this case, <C> is the new geometric support of the edge, <L> the new location, <Tol> the new tolerance. Otherwise, returns Standard_False, and <C>, <L>, <Tol> are not significant.

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF:
	:type NewF: TopoDS_Face &
	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewCurve2d;
		Standard_Boolean NewCurve2d (const TopoDS_Edge & E,const TopoDS_Face & F,const TopoDS_Edge & NewE,const TopoDS_Face & NewF,Handle_Geom2d_Curve & C,Standard_Real &OutValue);
		%feature("compactdefaultargs") NewParameter;
		%feature("autodoc", "	* Returns Standard_True if the Vertex <V> has a new parameter on the edge <E>. In this case, <P> is the parameter, <Tol> the new tolerance. Otherwise, returns Standard_False, and <P>, <Tol> are not significant.

	:param V:
	:type V: TopoDS_Vertex &
	:param E:
	:type E: TopoDS_Edge &
	:param P:
	:type P: float &
	:param Tol:
	:type Tol: float &
	:rtype: bool
") NewParameter;
		Standard_Boolean NewParameter (const TopoDS_Vertex & V,const TopoDS_Edge & E,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	* Returns the continuity of <NewE> between <NewF1> and <NewF2>. //! <NewE> is the new edge created from <E>. <NewF1> --resp. <NewF2>-- is the new face created from <F1> --resp. <F2>--.

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param NewE:
	:type NewE: TopoDS_Edge &
	:param NewF1:
	:type NewF1: TopoDS_Face &
	:param NewF2:
	:type NewF2: TopoDS_Face &
	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,const TopoDS_Edge & NewE,const TopoDS_Face & NewF1,const TopoDS_Face & NewF2);
};


%extend BRepOffset_SimpleOffset {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_BRepOffset_SimpleOffset(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_BRepOffset_SimpleOffset::Handle_BRepOffset_SimpleOffset %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_BRepOffset_SimpleOffset;
class Handle_BRepOffset_SimpleOffset : public Handle_BRepTools_Modification {

    public:
        // constructors
        Handle_BRepOffset_SimpleOffset();
        Handle_BRepOffset_SimpleOffset(const Handle_BRepOffset_SimpleOffset &aHandle);
        Handle_BRepOffset_SimpleOffset(const BRepOffset_SimpleOffset *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_BRepOffset_SimpleOffset DownCast(const Handle_Standard_Transient &AnObject);

};

%extend Handle_BRepOffset_SimpleOffset {
    BRepOffset_SimpleOffset* _get_reference() {
    return (BRepOffset_SimpleOffset*)$self->get();
    }
};

%extend Handle_BRepOffset_SimpleOffset {
     %pythoncode {
         def GetObject(self):
             obj = self._get_reference()
             register_handle(self, obj)
             return obj
     }
};

%extend BRepOffset_SimpleOffset {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BRepOffset_Tool {
	public:
		%feature("compactdefaultargs") EdgeVertices;
		%feature("autodoc", "	* <V1> is the FirstVertex ,<V2> is the Last Vertex of <Edge> taking account the orientation of Edge.

	:param E:
	:type E: TopoDS_Edge &
	:param V1:
	:type V1: TopoDS_Vertex &
	:param V2:
	:type V2: TopoDS_Vertex &
	:rtype: void
") EdgeVertices;
		static void EdgeVertices (const TopoDS_Edge & E,TopoDS_Vertex & V1,TopoDS_Vertex & V2);
		%feature("compactdefaultargs") OriEdgeInFace;
		%feature("autodoc", "	* returns the cumul of the orientation of <Edge> and thc containing wire in <Face>

	:param E:
	:type E: TopoDS_Edge &
	:param F:
	:type F: TopoDS_Face &
	:rtype: TopAbs_Orientation
") OriEdgeInFace;
		static TopAbs_Orientation OriEdgeInFace (const TopoDS_Edge & E,const TopoDS_Face & F);
		%feature("compactdefaultargs") OrientSection;
		%feature("autodoc", "	* <E> is a section between <F1> and <F2>. Computes <O1> the orientation of <E> in <F1> influenced by <F2>. idem for <O2>.

	:param E:
	:type E: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param O1:
	:type O1: TopAbs_Orientation &
	:param O2:
	:type O2: TopAbs_Orientation &
	:rtype: void
") OrientSection;
		static void OrientSection (const TopoDS_Edge & E,const TopoDS_Face & F1,const TopoDS_Face & F2,TopAbs_Orientation & O1,TopAbs_Orientation & O2);
		%feature("compactdefaultargs") FindCommonShapes;
		%feature("autodoc", "	* Looks for the common Vertices and Edges between faces <theF1> and <theF2>. Returns True if common shapes have been found. <theLE> will contain the found common edges; <theLV> will contain the found common vertices.

	:param theF1:
	:type theF1: TopoDS_Face &
	:param theF2:
	:type theF2: TopoDS_Face &
	:param theLE:
	:type theLE: TopTools_ListOfShape &
	:param theLV:
	:type theLV: TopTools_ListOfShape &
	:rtype: bool
") FindCommonShapes;
		static Standard_Boolean FindCommonShapes (const TopoDS_Face & theF1,const TopoDS_Face & theF2,TopTools_ListOfShape & theLE,TopTools_ListOfShape & theLV);
		%feature("compactdefaultargs") FindCommonShapes;
		%feature("autodoc", "	* Looks for the common shapes of type <theType> between shapes <theS1> and <theS2>. Returns True if common shapes have been found. <theLSC> will contain the found common shapes.

	:param theS1:
	:type theS1: TopoDS_Shape &
	:param theS2:
	:type theS2: TopoDS_Shape &
	:param theType:
	:type theType: TopAbs_ShapeEnum
	:param theLSC:
	:type theLSC: TopTools_ListOfShape &
	:rtype: bool
") FindCommonShapes;
		static Standard_Boolean FindCommonShapes (const TopoDS_Shape & theS1,const TopoDS_Shape & theS2,const TopAbs_ShapeEnum theType,TopTools_ListOfShape & theLSC);
		%feature("compactdefaultargs") Inter3D;
		%feature("autodoc", "	* Computes the Section betwwen <F1> and <F2> the edges solution are stored in <LInt1> with the orientation on <F1>, the sames edges are stored in <Lint2> with the orientation on <F2>.

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param LInt1:
	:type LInt1: TopTools_ListOfShape &
	:param LInt2:
	:type LInt2: TopTools_ListOfShape &
	:param Side:
	:type Side: TopAbs_State
	:param RefEdge:
	:type RefEdge: TopoDS_Edge &
	:param IsRefEdgeDefined: default value is Standard_False
	:type IsRefEdgeDefined: bool
	:rtype: void
") Inter3D;
		static void Inter3D (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side,const TopoDS_Edge & RefEdge,const Standard_Boolean IsRefEdgeDefined = Standard_False);
		%feature("compactdefaultargs") TryProject;
		%feature("autodoc", "	* Find if the edges <Edges> of the face <F2> are on the face <F1>. Set in <LInt1> <LInt2> the updated edges. If all the edges are computed, returns true.

	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param Edges:
	:type Edges: TopTools_ListOfShape &
	:param LInt1:
	:type LInt1: TopTools_ListOfShape &
	:param LInt2:
	:type LInt2: TopTools_ListOfShape &
	:param Side:
	:type Side: TopAbs_State
	:param TolConf:
	:type TolConf: float
	:rtype: bool
") TryProject;
		static Standard_Boolean TryProject (const TopoDS_Face & F1,const TopoDS_Face & F2,const TopTools_ListOfShape & Edges,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side,const Standard_Real TolConf);
		%feature("compactdefaultargs") PipeInter;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param LInt1:
	:type LInt1: TopTools_ListOfShape &
	:param LInt2:
	:type LInt2: TopTools_ListOfShape &
	:param Side:
	:type Side: TopAbs_State
	:rtype: void
") PipeInter;
		static void PipeInter (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side);
		%feature("compactdefaultargs") Inter2d;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param LV:
	:type LV: TopTools_ListOfShape &
	:param Tol:
	:type Tol: float
	:rtype: void
") Inter2d;
		static void Inter2d (const TopoDS_Face & F,const TopoDS_Edge & E1,const TopoDS_Edge & E2,TopTools_ListOfShape & LV,const Standard_Real Tol);
		%feature("compactdefaultargs") InterOrExtent;
		%feature("autodoc", "	:param F1:
	:type F1: TopoDS_Face &
	:param F2:
	:type F2: TopoDS_Face &
	:param LInt1:
	:type LInt1: TopTools_ListOfShape &
	:param LInt2:
	:type LInt2: TopTools_ListOfShape &
	:param Side:
	:type Side: TopAbs_State
	:rtype: void
") InterOrExtent;
		static void InterOrExtent (const TopoDS_Face & F1,const TopoDS_Face & F2,TopTools_ListOfShape & LInt1,TopTools_ListOfShape & LInt2,const TopAbs_State Side);
		%feature("compactdefaultargs") CheckBounds;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param Analyse:
	:type Analyse: BRepOffset_Analyse &
	:param enlargeU:
	:type enlargeU: bool
	:param enlargeVfirst:
	:type enlargeVfirst: bool
	:param enlargeVlast:
	:type enlargeVlast: bool
	:rtype: void
") CheckBounds;
		static void CheckBounds (const TopoDS_Face & F,const BRepOffset_Analyse & Analyse,Standard_Boolean &OutValue,Standard_Boolean &OutValue,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") EnLargeFace;
		%feature("autodoc", "	* if <ChangeGeom> is True , the surface can be changed . if <UpdatePCurve> is True, update the pcurves of the edges of <F> on the new surface.if the surface has been changed, Returns True if The Surface of <NF> has changed.

	:param F:
	:type F: TopoDS_Face &
	:param NF:
	:type NF: TopoDS_Face &
	:param ChangeGeom:
	:type ChangeGeom: bool
	:param UpDatePCurve: default value is Standard_False
	:type UpDatePCurve: bool
	:param enlargeU: default value is Standard_True
	:type enlargeU: bool
	:param enlargeVfirst: default value is Standard_True
	:type enlargeVfirst: bool
	:param enlargeVlast: default value is Standard_True
	:type enlargeVlast: bool
	:rtype: bool
") EnLargeFace;
		static Standard_Boolean EnLargeFace (const TopoDS_Face & F,TopoDS_Face & NF,const Standard_Boolean ChangeGeom,const Standard_Boolean UpDatePCurve = Standard_False,const Standard_Boolean enlargeU = Standard_True,const Standard_Boolean enlargeVfirst = Standard_True,const Standard_Boolean enlargeVlast = Standard_True);
		%feature("compactdefaultargs") ExtentFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param ConstShapes:
	:type ConstShapes: TopTools_DataMapOfShapeShape &
	:param ToBuild:
	:type ToBuild: TopTools_DataMapOfShapeShape &
	:param Side:
	:type Side: TopAbs_State
	:param TolConf:
	:type TolConf: float
	:param NF:
	:type NF: TopoDS_Face &
	:rtype: void
") ExtentFace;
		static void ExtentFace (const TopoDS_Face & F,TopTools_DataMapOfShapeShape & ConstShapes,TopTools_DataMapOfShapeShape & ToBuild,const TopAbs_State Side,const Standard_Real TolConf,TopoDS_Face & NF);
		%feature("compactdefaultargs") BuildNeighbour;
		%feature("autodoc", "	* Via the wire explorer store in <NOnV1> for an Edge <E> of <W> his Edge neighbour on the first vertex <V1> of <E>. Store in NOnV2 the Neighbour of <E>on the last vertex <V2> of <E>.

	:param W:
	:type W: TopoDS_Wire &
	:param F:
	:type F: TopoDS_Face &
	:param NOnV1:
	:type NOnV1: TopTools_DataMapOfShapeShape &
	:param NOnV2:
	:type NOnV2: TopTools_DataMapOfShapeShape &
	:rtype: void
") BuildNeighbour;
		static void BuildNeighbour (const TopoDS_Wire & W,const TopoDS_Face & F,TopTools_DataMapOfShapeShape & NOnV1,TopTools_DataMapOfShapeShape & NOnV2);
		%feature("compactdefaultargs") MapVertexEdges;
		%feature("autodoc", "	* Store in MVE for a vertex <V> in <S> the incident edges <E> in <S>. An Edge is Store only one Time for a vertex.

	:param S:
	:type S: TopoDS_Shape &
	:param MVE:
	:type MVE: TopTools_DataMapOfShapeListOfShape &
	:rtype: void
") MapVertexEdges;
		static void MapVertexEdges (const TopoDS_Shape & S,TopTools_DataMapOfShapeListOfShape & MVE);
		%feature("compactdefaultargs") Deboucle3D;
		%feature("autodoc", "	* Remove the non valid part of an offsetshape 1 - Remove all the free boundary and the faces connex to such edges. 2 - Remove all the shapes not valid in the result --according to the side of offseting-- in this verion only the first point is implemented.

	:param S:
	:type S: TopoDS_Shape &
	:param Boundary:
	:type Boundary: TopTools_MapOfShape &
	:rtype: TopoDS_Shape
") Deboucle3D;
		static TopoDS_Shape Deboucle3D (const TopoDS_Shape & S,const TopTools_MapOfShape & Boundary);
		%feature("compactdefaultargs") CorrectOrientation;
		%feature("autodoc", "	:param SI:
	:type SI: TopoDS_Shape &
	:param NewEdges:
	:type NewEdges: TopTools_IndexedMapOfShape &
	:param AsDes:
	:type AsDes: Handle_BRepAlgo_AsDes &
	:param InitOffset:
	:type InitOffset: BRepAlgo_Image &
	:param Offset:
	:type Offset: float
	:rtype: void
") CorrectOrientation;
		static void CorrectOrientation (const TopoDS_Shape & SI,const TopTools_IndexedMapOfShape & NewEdges,Handle_BRepAlgo_AsDes & AsDes,BRepAlgo_Image & InitOffset,const Standard_Real Offset);
		%feature("compactdefaultargs") Gabarit;
		%feature("autodoc", "	:param aCurve:
	:type aCurve: Handle_Geom_Curve &
	:rtype: float
") Gabarit;
		static Standard_Real Gabarit (const Handle_Geom_Curve & aCurve);
		%feature("compactdefaultargs") CheckPlanesNormals;
		%feature("autodoc", "	* Compares the normal directions of the planar faces and returns True if the directions are the same with the given precision.

	:param theFace1:
	:type theFace1: TopoDS_Face &
	:param theFace2:
	:type theFace2: TopoDS_Face &
	:param theTolAng: default value is 1e-8
	:type theTolAng: float
	:rtype: bool
") CheckPlanesNormals;
		static Standard_Boolean CheckPlanesNormals (const TopoDS_Face & theFace1,const TopoDS_Face & theFace2,const Standard_Real theTolAng = 1e-8);
};


%extend BRepOffset_Tool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

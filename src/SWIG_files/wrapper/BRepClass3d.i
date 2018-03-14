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
%define BREPCLASS3DDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BREPCLASS3DDOCSTRING) BRepClass3d

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


%include BRepClass3d_headers.i


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
%template(BRepClass3d_MapOfInter) NCollection_DataMap <TopoDS_Shape , Standard_Address , TopTools_ShapeMapHasher>;
%template(BRepClass3d_BndBoxTree) NCollection_UBTree <Standard_Integer , Bnd_Box>;
%template(BRepClass3d_DataMapIteratorOfMapOfInter) NCollection_TListIterator<BRepClass3d_MapOfInter>;
/* end templates declaration */

/* public enums */
/* end public enums declaration */

%rename(brepclass3d) BRepClass3d;
class BRepClass3d {
	public:
		%feature("compactdefaultargs") OuterShell;
		%feature("autodoc", "	* Returns the outer most shell of <S>. Returns a Null shell if <S> has no outer shell. If <S> has only one shell, then it will return, without checking orientation.

	:param S:
	:type S: TopoDS_Solid &
	:rtype: TopoDS_Shell
") OuterShell;
		static TopoDS_Shell OuterShell (const TopoDS_Solid & S);
};


%extend BRepClass3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass3d_Intersector3d;
class BRepClass3d_Intersector3d {
	public:
		%feature("compactdefaultargs") BRepClass3d_Intersector3d;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepClass3d_Intersector3d;
		 BRepClass3d_Intersector3d ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Perform the intersection between the segment L--0-- ... L--Prm-- and the Shape <Sh>. //! Only the point with the smallest parameter on the line is returned. //! The Tolerance <Tol> is used to determine if the first point of the segment is near the face. In that case, the parameter of the intersection point on the line can be a negative value --greater than -Tol--.

	:param L:
	:type L: gp_Lin
	:param Prm:
	:type Prm: float
	:param Tol:
	:type Tol: float
	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Perform;
		void Perform (const gp_Lin & L,const Standard_Real Prm,const Standard_Real Tol,const TopoDS_Face & F);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	* True is returned when the intersection have been computed.

	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
		%feature("compactdefaultargs") HasAPoint;
		%feature("autodoc", "	* True is returned if a point has been found.

	:rtype: bool
") HasAPoint;
		Standard_Boolean HasAPoint ();
		%feature("compactdefaultargs") UParameter;
		%feature("autodoc", "	* Returns the U parameter of the intersection point on the surface.

	:rtype: float
") UParameter;
		Standard_Real UParameter ();
		%feature("compactdefaultargs") VParameter;
		%feature("autodoc", "	* Returns the V parameter of the intersection point on the surface.

	:rtype: float
") VParameter;
		Standard_Real VParameter ();
		%feature("compactdefaultargs") WParameter;
		%feature("autodoc", "	* Returns the parameter of the intersection point on the line.

	:rtype: float
") WParameter;
		Standard_Real WParameter ();
		%feature("compactdefaultargs") Pnt;
		%feature("autodoc", "	* Returns the geometric point of the intersection between the line and the surface.

	:rtype: gp_Pnt
") Pnt;
		const gp_Pnt  Pnt ();
		%feature("compactdefaultargs") Transition;
		%feature("autodoc", "	* Returns the transition of the line on the surface.

	:rtype: IntCurveSurface_TransitionOnCurve
") Transition;
		IntCurveSurface_TransitionOnCurve Transition ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns the state of the point on the face. The values can be either TopAbs_IN -- the point is in the face-- or TopAbs_ON -- the point is on a boudary of the face--.

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the significant face used to determine the intersection.

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();
};


%extend BRepClass3d_Intersector3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass3d_SClassifier;
class BRepClass3d_SClassifier {
	public:
		%feature("compactdefaultargs") BRepClass3d_SClassifier;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier ();
		%feature("compactdefaultargs") BRepClass3d_SClassifier;
		%feature("autodoc", "	* Constructor to classify the point P with the tolerance Tol on the solid S.

	:param S:
	:type S: BRepClass3d_SolidExplorer &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepClass3d_SClassifier;
		 BRepClass3d_SClassifier (BRepClass3d_SolidExplorer & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Classify the point P with the tolerance Tol on the solid S.

	:param S:
	:type S: BRepClass3d_SolidExplorer &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (BRepClass3d_SolidExplorer & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "	* Classify an infinite point with the tolerance Tol on the solid S.

	:param S:
	:type S: BRepClass3d_SolidExplorer &
	:param Tol:
	:type Tol: float
	:rtype: None
") PerformInfinitePoint;
		void PerformInfinitePoint (BRepClass3d_SolidExplorer & S,const Standard_Real Tol);
		%feature("compactdefaultargs") Rejected;
		%feature("autodoc", "	* Returns True if the classification has been computed by rejection. The State is then OUT.

	:rtype: bool
") Rejected;
		Standard_Boolean Rejected ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns the result of the classification.

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
		%feature("compactdefaultargs") IsOnAFace;
		%feature("autodoc", "	* Returns True when the point is a point of a face.

	:rtype: bool
") IsOnAFace;
		Standard_Boolean IsOnAFace ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns the face used to determine the classification. When the state is ON, this is the face containing the point. //! When Rejected---- returns True, Face---- has no signification.

	:rtype: TopoDS_Face
") Face;
		TopoDS_Face Face ();
};


%extend BRepClass3d_SClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass3d_SolidExplorer;
class BRepClass3d_SolidExplorer {
	public:
		%feature("compactdefaultargs") BRepClass3d_SolidExplorer;
		%feature("autodoc", "	:rtype: None
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer ();
		%feature("compactdefaultargs") BRepClass3d_SolidExplorer;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepClass3d_SolidExplorer;
		 BRepClass3d_SolidExplorer (const TopoDS_Shape & S);
		%feature("compactdefaultargs") InitShape;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") InitShape;
		void InitShape (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	* Should return True if P outside of bounding vol. of the shape

	:param P:
	:type P: gp_Pnt
	:rtype: bool
") Reject;
		virtual Standard_Boolean Reject (const gp_Pnt & P);
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "	* compute a point P in the face F. Param is a Real in ]0,1[ and is used to initialise the algorithm. For different values , different points are returned.

	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param Param:
	:type Param: float &
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue);
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:param theVecD1U:
	:type theVecD1U: gp_Vec
	:param theVecD1V:
	:type theVecD1V: gp_Vec
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,gp_Vec & theVecD1U,gp_Vec & theVecD1V);
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,gp_Pnt & P);
		%feature("compactdefaultargs") FindAPointInTheFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:rtype: bool
") FindAPointInTheFace;
		static Standard_Boolean FindAPointInTheFace (const TopoDS_Face & F,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:param Index:
	:type Index: int &
	:rtype: bool
") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:param Index:
	:type Index: int &
	:param surf:
	:type surf: Handle_BRepAdaptor_HSurface &
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:rtype: bool
") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,const Handle_BRepAdaptor_HSurface & surf,const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2);
		%feature("compactdefaultargs") PointInTheFace;
		%feature("autodoc", "	* <Index> gives point index to search from and returns point index of succeseful search

	:param F:
	:type F: TopoDS_Face &
	:param P:
	:type P: gp_Pnt
	:param u:
	:type u: float &
	:param v:
	:type v: float &
	:param Param:
	:type Param: float &
	:param Index:
	:type Index: int &
	:param surf:
	:type surf: Handle_BRepAdaptor_HSurface &
	:param u1:
	:type u1: float
	:param v1:
	:type v1: float
	:param u2:
	:type u2: float
	:param v2:
	:type v2: float
	:param theVecD1U:
	:type theVecD1U: gp_Vec
	:param theVecD1V:
	:type theVecD1V: gp_Vec
	:rtype: bool
") PointInTheFace;
		Standard_Boolean PointInTheFace (const TopoDS_Face & F,gp_Pnt & P,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Integer &OutValue,const Handle_BRepAdaptor_HSurface & surf,const Standard_Real u1,const Standard_Real v1,const Standard_Real u2,const Standard_Real v2,gp_Vec & theVecD1U,gp_Vec & theVecD1V);
		%feature("compactdefaultargs") InitShell;
		%feature("autodoc", "	* Starts an exploration of the shells.

	:rtype: None
") InitShell;
		void InitShell ();
		%feature("compactdefaultargs") MoreShell;
		%feature("autodoc", "	* Returns True if there is a current shell.

	:rtype: bool
") MoreShell;
		Standard_Boolean MoreShell ();
		%feature("compactdefaultargs") NextShell;
		%feature("autodoc", "	* Sets the explorer to the next shell.

	:rtype: None
") NextShell;
		void NextShell ();
		%feature("compactdefaultargs") CurrentShell;
		%feature("autodoc", "	* Returns the current shell.

	:rtype: TopoDS_Shell
") CurrentShell;
		TopoDS_Shell CurrentShell ();
		%feature("compactdefaultargs") RejectShell;
		%feature("autodoc", "	* Returns True if the Shell is rejected.

	:param L:
	:type L: gp_Lin
	:rtype: bool
") RejectShell;
		virtual Standard_Boolean RejectShell (const gp_Lin & L);
		%feature("compactdefaultargs") InitFace;
		%feature("autodoc", "	* Starts an exploration of the faces of the current shell.

	:rtype: None
") InitFace;
		void InitFace ();
		%feature("compactdefaultargs") MoreFace;
		%feature("autodoc", "	* Returns True if current face in current shell.

	:rtype: bool
") MoreFace;
		Standard_Boolean MoreFace ();
		%feature("compactdefaultargs") NextFace;
		%feature("autodoc", "	* Sets the explorer to the next Face of the current shell.

	:rtype: None
") NextFace;
		void NextFace ();
		%feature("compactdefaultargs") CurrentFace;
		%feature("autodoc", "	* Returns the current face.

	:rtype: TopoDS_Face
") CurrentFace;
		TopoDS_Face CurrentFace ();
		%feature("compactdefaultargs") RejectFace;
		%feature("autodoc", "	* returns True if the face is rejected.

	:param L:
	:type L: gp_Lin
	:rtype: bool
") RejectFace;
		virtual Standard_Boolean RejectFace (const gp_Lin & L);
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "	* Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections.

	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float &
	:rtype: int
") Segment;
		Standard_Integer Segment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") OtherSegment;
		%feature("autodoc", "	* Returns in <L>, <Par> a segment having at least one intersection with the shape boundary to compute intersections. //! The First Call to this method returns a line which point to a point of the first face of the shape. The Second Call provide a line to the second face and so on.

	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float &
	:rtype: int
") OtherSegment;
		Standard_Integer OtherSegment (const gp_Pnt & P,gp_Lin & L,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetFaceSegmentIndex;
		%feature("autodoc", "	* Returns the index of face for which last segment is calculated.

	:rtype: int
") GetFaceSegmentIndex;
		Standard_Integer GetFaceSegmentIndex ();
		%feature("compactdefaultargs") DumpSegment;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:param L:
	:type L: gp_Lin
	:param Par:
	:type Par: float
	:param S:
	:type S: TopAbs_State
	:rtype: void
") DumpSegment;
		virtual void DumpSegment (const gp_Pnt & P,const gp_Lin & L,const Standard_Real Par,const TopAbs_State S);
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "	:rtype: Bnd_Box
") Box;
		const Bnd_Box & Box ();
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") GetShape;
		const TopoDS_Shape  GetShape ();
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: IntCurvesFace_Intersector
") Intersector;
		IntCurvesFace_Intersector & Intersector (const TopoDS_Face & F);
		%feature("compactdefaultargs") GetTree;
		%feature("autodoc", "	* Return UB-tree instance which is used for edge / vertex checks.

	:rtype: BRepClass3d_BndBoxTree
") GetTree;
		const BRepClass3d_BndBoxTree & GetTree ();
		%feature("compactdefaultargs") GetMapEV;
		%feature("autodoc", "	* Return edge/vertices map for current shape.

	:rtype: TopTools_IndexedMapOfShape
") GetMapEV;
		const TopTools_IndexedMapOfShape & GetMapEV ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%extend BRepClass3d_SolidExplorer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass3d_SolidPassiveClassifier;
class BRepClass3d_SolidPassiveClassifier {
	public:
		%feature("compactdefaultargs") BRepClass3d_SolidPassiveClassifier;
		%feature("autodoc", "	* Creates an undefined classifier.

	:rtype: None
") BRepClass3d_SolidPassiveClassifier;
		 BRepClass3d_SolidPassiveClassifier ();
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", "	* Starts a classification process. The point to classify is the origin of the line <L>. <P> is the original length of the segment on <L> used to compute intersections. <Tol> is the tolerance attached to the intersections.

	:param L:
	:type L: gp_Lin
	:param P:
	:type P: float
	:param Tol:
	:type Tol: float
	:rtype: None
") Reset;
		void Reset (const gp_Lin & L,const Standard_Real P,const Standard_Real Tol);
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "	* Updates the classification process with the face <F> from the boundary.

	:param F:
	:type F: TopoDS_Face &
	:param Or:
	:type Or: TopAbs_Orientation
	:rtype: None
") Compare;
		void Compare (const TopoDS_Face & F,const TopAbs_Orientation Or);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the current value of the parameter.

	:rtype: float
") Parameter;
		Standard_Real Parameter ();
		%feature("compactdefaultargs") HasIntersection;
		%feature("autodoc", "	* Returns True if an intersection is computed.

	:rtype: bool
") HasIntersection;
		Standard_Boolean HasIntersection ();
		%feature("compactdefaultargs") Intersector;
		%feature("autodoc", "	* Returns the intersecting algorithm.

	:rtype: BRepClass3d_Intersector3d
") Intersector;
		BRepClass3d_Intersector3d & Intersector ();
		%feature("compactdefaultargs") State;
		%feature("autodoc", "	* Returns the current state of the point.

	:rtype: TopAbs_State
") State;
		TopAbs_State State ();
};


%extend BRepClass3d_SolidPassiveClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass3d_BndBoxTreeSelectorLine;
class BRepClass3d_BndBoxTreeSelectorLine : public BRepClass3d_BndBoxTree::Selector {
	public:
		%feature("compactdefaultargs") BRepClass3d_BndBoxTreeSelectorLine;
		%feature("autodoc", "	:param theMapOfShape:
	:type theMapOfShape: TopTools_IndexedMapOfShape &
	:rtype: None
") BRepClass3d_BndBoxTreeSelectorLine;
		 BRepClass3d_BndBoxTreeSelectorLine (const TopTools_IndexedMapOfShape & theMapOfShape);
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: bool
") Reject;
		Standard_Boolean Reject (const Bnd_Box & theBox);
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "	:param theObj:
	:type theObj: int &
	:rtype: bool
") Accept;
		Standard_Boolean Accept (const Standard_Integer & theObj);
		%feature("compactdefaultargs") SetCurrentLine;
		%feature("autodoc", "	:param theL:
	:type theL: gp_Lin
	:param theMaxParam:
	:type theMaxParam: float
	:rtype: None
") SetCurrentLine;
		void SetCurrentLine (const gp_Lin & theL,const Standard_Real theMaxParam);
		%feature("compactdefaultargs") GetEdgeParam;
		%feature("autodoc", "	:param i:
	:type i: int
	:param theOutE:
	:type theOutE: TopoDS_Edge &
	:param theOutParam:
	:type theOutParam: float &
	:param outLParam:
	:type outLParam: float &
	:rtype: None
") GetEdgeParam;
		void GetEdgeParam (const Standard_Integer i,TopoDS_Edge & theOutE,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetVertParam;
		%feature("autodoc", "	:param i:
	:type i: int
	:param theOutV:
	:type theOutV: TopoDS_Vertex &
	:param outLParam:
	:type outLParam: float &
	:rtype: None
") GetVertParam;
		void GetVertParam (const Standard_Integer i,TopoDS_Vertex & theOutV,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetNbEdgeParam;
		%feature("autodoc", "	:rtype: int
") GetNbEdgeParam;
		Standard_Integer GetNbEdgeParam ();
		%feature("compactdefaultargs") GetNbVertParam;
		%feature("autodoc", "	:rtype: int
") GetNbVertParam;
		Standard_Integer GetNbVertParam ();
		%feature("compactdefaultargs") ClearResults;
		%feature("autodoc", "	:rtype: None
") ClearResults;
		void ClearResults ();
};


%extend BRepClass3d_BndBoxTreeSelectorLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass3d_BndBoxTreeSelectorPoint;
class BRepClass3d_BndBoxTreeSelectorPoint : public BRepClass3d_BndBoxTree::Selector {
	public:
		%feature("compactdefaultargs") BRepClass3d_BndBoxTreeSelectorPoint;
		%feature("autodoc", "	:param theMapOfShape:
	:type theMapOfShape: TopTools_IndexedMapOfShape &
	:rtype: None
") BRepClass3d_BndBoxTreeSelectorPoint;
		 BRepClass3d_BndBoxTreeSelectorPoint (const TopTools_IndexedMapOfShape & theMapOfShape);
		%feature("compactdefaultargs") Reject;
		%feature("autodoc", "	:param theBox:
	:type theBox: Bnd_Box &
	:rtype: bool
") Reject;
		Standard_Boolean Reject (const Bnd_Box & theBox);
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "	:param theObj:
	:type theObj: int &
	:rtype: bool
") Accept;
		Standard_Boolean Accept (const Standard_Integer & theObj);
		%feature("compactdefaultargs") SetCurrentPoint;
		%feature("autodoc", "	:param theP:
	:type theP: gp_Pnt
	:rtype: None
") SetCurrentPoint;
		void SetCurrentPoint (const gp_Pnt & theP);
};


%extend BRepClass3d_BndBoxTreeSelectorPoint {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepClass3d_SolidClassifier;
class BRepClass3d_SolidClassifier : public BRepClass3d_SClassifier {
	public:
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "	* empty constructor

	:rtype: None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Load;
		void Load (const TopoDS_Shape & S);
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "	* Constructor from a Shape.

	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier (const TopoDS_Shape & S);
		%feature("compactdefaultargs") BRepClass3d_SolidClassifier;
		%feature("autodoc", "	* Constructor to classify the point P with the tolerance Tol on the solid S.

	:param S:
	:type S: TopoDS_Shape &
	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None
") BRepClass3d_SolidClassifier;
		 BRepClass3d_SolidClassifier (const TopoDS_Shape & S,const gp_Pnt & P,const Standard_Real Tol);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Classify the point P with the tolerance Tol on the solid S.

	:param P:
	:type P: gp_Pnt
	:param Tol:
	:type Tol: float
	:rtype: None
") Perform;
		void Perform (const gp_Pnt & P,const Standard_Real Tol);
		%feature("compactdefaultargs") PerformInfinitePoint;
		%feature("autodoc", "	* Classify an infinite point with the tolerance Tol on the solid S. Useful for compute the orientation of a solid.

	:param Tol:
	:type Tol: float
	:rtype: None
") PerformInfinitePoint;
		void PerformInfinitePoint (const Standard_Real Tol);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	:rtype: None
") Destroy;
		void Destroy ();
};


%extend BRepClass3d_SolidClassifier {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

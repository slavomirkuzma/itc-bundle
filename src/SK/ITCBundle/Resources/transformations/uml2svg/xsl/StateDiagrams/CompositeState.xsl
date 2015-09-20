<?xml version="1.0" encoding="UTF-8"?>
<!-- Template: CompositeState.xsl Displays CompositeState as a rounded rectangle 
	with NameCompartment, InternalTransitionCompartment and substates -->
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/2000/svg"
	xmlns:UML="org.omg.xmi.namespace.UML">
	<xsl:import href="../Common/Styling.xsl" />
	<xsl:import href="../Common/NameCompartment.xsl" />
	<xsl:import href="../Common/CompartmentSeparator.xsl" />
	<xsl:import href="../StateDiagrams/InternalTransitionCompartment.xsl" />
	<xsl:import href="../StateDiagrams/RegionCompartment.xsl" />
	<xsl:import href="../StateDiagrams/SubStates.xsl" />
	<xsl:output
		media-type="image/svg+xml"
		method="xml"
		indent="yes" />

	<!-- CompositeState -->
	<xsl:template name="CompositeState">

		<xsl:variable
			name="SemanticID"
			select="UML:GraphElement.semanticModel/UML:Uml1SemanticModelBridge/UML:Uml1SemanticModelBridge.element/*/@xmi.idref" />

		<!-- Main CompositeState group -->
		<g
			id="{@xmi.id}"
			transform="translate({UML:GraphElement.position/XMI.field[1]}, {UML:GraphElement.position/XMI.field[2]})">
			<xsl:apply-templates
				select="."
				mode="FontStyle" />
			<xsl:apply-templates
				select="."
				mode="StrokeStyle" />
			<xsl:apply-templates
				select="."
				mode="isVisible" />

			<title>
				<xsl:value-of select="key('xmi.id', $SemanticID)/@name" />
			</title>
			<desc>
				<xsl:text>CompositeState</xsl:text>
			</desc>

			<!-- The outline shape, a rounded rectangle -->
			<rect
				width="{UML:GraphNode.size/XMI.field[1]}"
				height="{UML:GraphNode.size/XMI.field[2]}"
				rx="8"
				ry="6">
				<xsl:apply-templates
					select="."
					mode="FillStyle" />
			</rect>

			<!-- Contained nodes -->
			<xsl:for-each select="UML:GraphElement.contained/UML:GraphNode">
				<xsl:choose>
					<xsl:when
						test="UML:GraphElement.semanticModel/UML:SimpleSemanticModelElement/@typeInfo = 'NameCompartment'">
						<!-- Name compartment -->
						<xsl:call-template name="NameCompartment" />
					</xsl:when>

					<xsl:when
						test="UML:GraphElement.semanticModel/UML:SimpleSemanticModelElement/@typeInfo = 'CompartmentSeparator'">
						<!-- Compartment separator -->
						<xsl:call-template name="CompartmentSeparator" />
					</xsl:when>

					<xsl:when
						test="UML:GraphElement.semanticModel/UML:SimpleSemanticModelElement/@typeInfo = 'InternalTransitionCompartment'">
						<!-- Internal Transitions -->
						<xsl:call-template name="InternalTransitionCompartment" />
					</xsl:when>

					<xsl:when
						test="UML:GraphElement.semanticModel/UML:SimpleSemanticModelElement/@typeInfo = 'SubStateCompartment'">
						<!-- Sub states -->
						<xsl:call-template name="SubStates" />
					</xsl:when>

					<xsl:when
						test="UML:GraphElement.semanticModel/UML:SimpleSemanticModelElement/@typeInfo = 'RegionCompartment'">
						<!-- Sub regions -->
						<xsl:call-template name="RegionCompartment" />
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>
		</g>
	</xsl:template>
</xsl:stylesheet>

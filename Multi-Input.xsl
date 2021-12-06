<?xml version="1.0"?>
<xsl:stylesheet version="2.0"
              	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
              	xmlns:mml="http://www.w3.org/1998/Math/MathML">
	<xsl:output method="text"/>
	<xsl:template name="list">
		<xsl:result-document href="copy-eqbr.bat">
			<list>
				<xsl:for-each select="collection('file:///D:/EquationBreaking/DoneFiles?select=*.eqbr.xml;recurse=yes;on-error=warning ')">
					<xsl:text>xcopy "</xsl:text>
					<xsl:value-of select="document-uri(.)"/>
					<xsl:text>" "D:\EquationBreaking\Eqbr\</xsl:text>
					<xsl:value-of select="substring-before(tokenize(document-uri(.), '/')[last()],'eqbr.xml')"/>
					<xsl:text>"
					</xsl:text>
				</xsl:for-each>
			</list>
		</xsl:result-document>
	</xsl:template>
</xsl:stylesheet>

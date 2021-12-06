<xsl:template name="normalize-returns">
	<xsl:param name="text"/>
	<xsl:choose>
		<xsl:when test="contains($text, '&#10;&#10;')">
			<!-- recursive call -->
			<xsl:call-template name="normalize-returns">
				<xsl:with-param name="text">
					<xsl:value-of select="substring-before($text, '&#10;&#10;')"/>
					<xsl:text>&#10;</xsl:text>
					<xsl:value-of select="substring-after($text, '&#10;&#10;')"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$text"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
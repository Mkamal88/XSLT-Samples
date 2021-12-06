<xsl:template name="Validate">
	<xsl:param name="day"/>
	<xsl:param name="month"/>
	<xsl:param name="year"/>
	<xsl:param name="duration"/>
	<xsl:variable name="checkmonth">
		<xsl:choose>
			<xsl:when test="contains('01 03 05 07 08 10 12',$month)">
				<xsl:value-of select="31"/>
			</xsl:when>
			<xsl:when test="contains('04 06 09 11',$month)">
				<xsl:value-of select="30"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:if test="($year mod 4)=0 and (($year mod 100)!=0 or ($year mod 400)=0)">
					<xsl:value-of select="29"/>
				</xsl:if>
				<xsl:if test="not(($year mod 4)=0 and (($year mod 100)!=0 or ($year mod 400)=0))">
					<xsl:value-of select="28"/>
				</xsl:if>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:choose>
		<xsl:when test="$checkmonth - $day &gt;= $duration - 1">
			<xsl:variable name="newday">
				<xsl:choose>
					<xsl:when test="(($day + $duration) - 1) &gt; 9">
						<xsl:value-of select="($day + $duration) - 1"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="concat('0',($day + $duration) - 1)"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:value-of select="concat($month,'/',$newday,'/',$year)"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="Validate">
				<xsl:with-param name="day">00</xsl:with-param>
				<xsl:with-param name="month">
					<xsl:choose>
						<xsl:when test="$month &lt; '12' ">
							<xsl:value-of select="$month + 1"/>
						</xsl:when>
						<xsl:otherwise>01</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="year">
					<xsl:choose>
						<xsl:when test="$month &lt; '12' ">
							<xsl:value-of select="$year"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$year + 1"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:with-param>
				<xsl:with-param name="duration">
					<xsl:value-of select="$duration  - ( $checkmonth - $day)"/>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>
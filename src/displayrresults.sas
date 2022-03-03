/***********************************************************************************/
/* Program Name: displayrresults                                              	   */
/* Date Created: 12/15/2021                                                        */
/* Author: 	Manuel Figallo                                                         */
/* Purpose: display R output to a SAS Studio Window                                */
/*                                                                                 */
/* ------------------------------------------------------------------------------- */
/*                                                                                 */
/* Input(s): fn is the filename input for the SAS R output                         */
/*                                                                                 */
/* ---------------------THE SECTION BELOW IS FOR FUTURE ENHANCEMENTS-------------- */
/* Date Modified: 08/15/2022                                                       */
/* Modified by: Manuel Figallo                                                     */
/* Reason for Modification: Exception Handling. Attachment Count                   */
/* Modification Made: TBD                                                          */
/***********************************************************************************/
%macro displayrresults(fn=);
	ods escapechar="^"; 
	 
	ods text='^S={preimage=&fn}';
	 
	data temp1; 
	 success=" "; 
	run; 
	                                                                                                                                        
	proc report data=temp1 nowd noheader style(report)={rules=none frame=void outputheight=10% outputwidth=10%}; 
	  column center; 
	  define center / style={just=c}; 
	run; 
	/**/
	ods  _ALL_  close;      
%mend displayrresults;

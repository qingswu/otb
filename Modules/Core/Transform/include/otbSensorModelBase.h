/*
 * Copyright (C) 2005-2020 Centre National d'Etudes Spatiales (CNES)
 *
 * This file is part of Orfeo Toolbox
 *
 *     https://www.orfeo-toolbox.org/
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef otbSensorModelBase_h
#define otbSensorModelBase_h

#include "otbMacro.h"
#include "otbImageMetadata.h"

#include "otbTransform.h"
#include "itkSmartPointer.h"

namespace otb
{
/** \class SensorModelBase
 *  \brief Base class for the sensor model projection classes.
 *
 *  This is the base class for sensor model projection classes. Those
 *  classes allow:
 *
 *  - Forward Transformation of a point in the sensor geometry (i, j)
 *  to a geographic point in (lat, long)
 *
 *  - Inverse Transformation of a a geographic point in (lat, long) to
 *  a point in the sensor geometry (i, j).
 *
 * \ingroup Projection
 * \ingroup OTBTransform
 */
template <class TScalarType, unsigned int NInputDimensions = 2, unsigned int NOutputDimensions = 3>
class ITK_EXPORT SensorModelBase : public Transform<TScalarType, NInputDimensions, NOutputDimensions>
{

public:
  /** @name Standard class type definitions */
  //@{
  using Self         = SensorModelBase;
  using Superclass   = Transform<TScalarType, NInputDimensions, NOutputDimensions>;
  using Pointer      = itk::SmartPointer<Self>;
  using ConstPointer = itk::SmartPointer<const Self> ;

  using InputPointType  = itk::Point<TScalarType, NInputDimensions>;
  using OutputPointType = itk::Point<TScalarType, NOutputDimensions>;
  using PixelType =TScalarType;
  //@}

  /** Run-time type information (and related methods). */
  itkTypeMacro(Self, Superclass);

  itkStaticConstMacro(InputSpaceDimension, unsigned int, NInputDimensions);
  itkStaticConstMacro(OutputSpaceDimension, unsigned int, NOutputDimensions);

  /*
   * Set the model as it is defined in the ImageMetadata.
   * Used by the factory to find the correct class.
   * Return false if model not valid.
   */
  virtual bool SetMetadataModel(boost::any imdModel) = 0;

  /** Check model validity */
  virtual bool IsValidSensorModel() const = 0;

protected:
  SensorModelBase() = default;
  ~SensorModelBase() = default;

private:
  SensorModelBase(const Self&) = delete;
  void operator=(const Self&) = delete;
};

} // namespace otb

#endif
